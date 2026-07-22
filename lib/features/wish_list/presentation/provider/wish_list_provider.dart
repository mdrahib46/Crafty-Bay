
import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/model/wish_list_model.dart';

class WishListProvider extends ChangeNotifier {
  bool _isInitialLoading = false;
  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<WishListModel> _wishList = [];
  List<WishListModel> get wishList => _wishList;

  int _currentPage = 0;
  int? _lastPage;
  final int _itemPerPage = 32;

  Future<bool> getWishListData() async {
    bool isSuccess = false;

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

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.getWishList(_itemPerPage, _currentPage),
    );

    if (response.isSuccess) {
      List<WishListModel> list = [];
      for (Map<String, dynamic> jsonData
          in response.responseBody['data']['result']) {
        list.add(WishListModel.formJson(jsonData));
      }
      _wishList.addAll(list);

      _lastPage = response.responseBody['data']['last_page'];
    }

    if (_currentPage == 1) {
      _isInitialLoading = false;
    } else {
      _isLoadingMore = false;
    }
    notifyListeners();

    return isSuccess;
  }

  void refreshWishList() {
    _wishList.clear();
    _currentPage = 0;
    _lastPage = null;
    getWishListData();
  }

  bool get isLoading => _isInitialLoading || _isLoadingMore;
}
