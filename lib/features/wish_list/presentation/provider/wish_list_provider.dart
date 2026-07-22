
import 'package:craftybay/features/product/data/models/product_model.dart';
// import 'package:craftybay/features/wish_list/data/model/wish_list_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/controller/auth_controller.dart';
import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';

class WishListProvider extends ChangeNotifier {
  bool _isInitialLoading = false;
  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<ProductModel> _wishList = [];
  List<ProductModel> get wishList => _wishList;

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

    debugPrint('Token: ${AuthController.accessToken}');

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.getWishList(_itemPerPage, _currentPage),
    );

    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> jsonData
          in response.responseBody['data']['results']) {
        list.add(ProductModel.formJson(jsonData['product']));
      }
      _wishList.addAll(list);

      _lastPage = response.responseBody['data']['last_page'];


      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
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
