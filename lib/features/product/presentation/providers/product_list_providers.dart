import 'package:craftybay/app/get_network_caller.dart';
import 'package:craftybay/app/urls.dart';
import 'package:craftybay/core/service/network_caller/network_caller.dart';
import 'package:craftybay/features/product/data/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductListProviders extends ChangeNotifier {
  bool _isInitialLoading = false;

  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;

  bool get isLoadingMore => _isLoadingMore;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  int? _lastPage;
  int _currentPage = 0;
  final int _productPerPage = 20;

  //
  Future<bool> getProductList() async {
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

    NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.getProduct(_productPerPage, _currentPage),
    );

    if (response.isSuccess) {
      List<ProductModel> list = [];

      for (Map<String, dynamic> jsonData
          in response.responseBody['data']['results']) {
        list.add(ProductModel.formJson(jsonData));
      }

      productList.addAll(list);
      _lastPage = response.responseBody['data']['last_page'];

      _errorMessage = null;
    } else {
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

  void refreshProduct() {
    _currentPage = 0;
    _lastPage = null;
    _productList.clear();
    getProductList();
  }


  bool get isLoading => _isInitialLoading || isLoadingMore;
}
