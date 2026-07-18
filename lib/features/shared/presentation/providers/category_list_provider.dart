import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/model/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  bool _isInitialLoading = false;
  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  int? _lastPage;
  int _currentPage = 0;
  final int _categoryPerPage = 32;

  Future<bool> getCategoryData() async {
    bool isSuccess = false;

    /// Current page is greater then last page or is that initial page
    if (_currentPage == 0 || (_lastPage != null && _currentPage < _lastPage!)) {
      _currentPage++;
    } else {
      return false;
    }

    if (_currentPage == 1) {
      _isInitialLoading = true;
    } else {
      _isLoadingMore = true;
    }
    notifyListeners();

    /// Call API form here
    NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.getCategory(_categoryPerPage, _currentPage),
    );

    if (response.isSuccess) {
      List<CategoryModel> list = [];

      for (Map<String, dynamic> jsonData
          in response.responseBody['data']['results']) {
        list.add(CategoryModel.fromJson(jsonData));
      }

      _categoryList.addAll(list);

      _lastPage = response.responseBody['data']['last_page'];

      // isSuccess = true;
      // _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
      // _currentPage --;
    }

    if (_currentPage == 1) {
      _isInitialLoading = false;
    } else {
      _isLoadingMore = false;
    }
    notifyListeners();

    return isSuccess;
  }

  void refreshCategory() {
    _currentPage = 0;
    _lastPage = null;
    _categoryList.clear();
    getCategoryData();
  }

  bool get isLoading => _isInitialLoading || _isLoadingMore;
}



