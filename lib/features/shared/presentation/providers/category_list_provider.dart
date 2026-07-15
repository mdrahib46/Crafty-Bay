import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/model/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _pageCount = 32;
  int _currentPage = 0;
  int? _lastPage;

  /// Initial data is loading
  bool _getInitialInProgress = false;

  bool get getInitialInProgress => _getInitialInProgress;

  /// More data is loading
  bool _getMoreDataInProgress = false;

  bool get getMoreDataInProgress => _getMoreDataInProgress;

  List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList => _categoryList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategory() async {
    /// To Stop Pagination
    if (_lastPage != null && _currentPage >= _lastPage!) {
      return false;
    }

    bool isSuccess = false;
    _currentPage++;

    if (isFirstRequest) {
      _getInitialInProgress = true;
    } else {
      _getMoreDataInProgress = true;
    }
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.getCategory(_pageCount, _currentPage),
    );

    if (response.isSuccess) {
      List<CategoryModel> categories = [];
      _lastPage = response.responseBody['data']['last_page'];
      for (Map<String, dynamic> category
          in response.responseBody['data']['results']) {
        categories.add(CategoryModel.fromJson(category));
      }
      _categoryList.addAll(categories);
      isSuccess = true;
      _errorMessage = null;
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    if (isFirstRequest) {
      _getInitialInProgress = false;
    } else {
      _getMoreDataInProgress = false;
    }
    notifyListeners();

    return isSuccess;
  }

  bool get isFirstRequest => _currentPage == 0;

  void refreshCategoryList() {
    _currentPage = 0;
    _lastPage = null;
    _categoryList.clear();
    getCategory();
  }

  bool get isLoading => getInitialInProgress || _getMoreDataInProgress;
}
