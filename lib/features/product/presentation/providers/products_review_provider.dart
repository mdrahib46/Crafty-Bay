import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/models/product_review_model.dart';

class ProductsReviewProvider extends ChangeNotifier {
  bool _isInitialLoading = false;

  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;

  bool get isLoadingMore => _isLoadingMore;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final List<ProductReviewModel> _reviewList = [];

  List<ProductReviewModel> get reviewList => _reviewList;

  int _currentPage = 0;
  int? _lastPage;
  final int _itemPerPage = 10;

  Future<bool> getReviewListData(String itemId) async {
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
      AppUrls.getReviewList(_itemPerPage, _currentPage, itemId),
    );

    if (response.isSuccess) {
      List<ProductReviewModel> list = [];

      for (Map<String, dynamic> jsonData
          in response.responseBody['data']['results']) {
        list.add(ProductReviewModel.fromJson(jsonData));
      }

      _reviewList.addAll(list);
      _lastPage = response.responseBody['data']['last_page'];

      _errorMessage = null;
      isSuccess = true;
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

  void refreshReview(String itemId) async {
    _currentPage = 0;
    _lastPage = null;
    _errorMessage = null;
    _reviewList.clear();
    await getReviewListData(itemId);
    notifyListeners();
  }

  bool get isLoading => _isInitialLoading || isLoadingMore;
}
