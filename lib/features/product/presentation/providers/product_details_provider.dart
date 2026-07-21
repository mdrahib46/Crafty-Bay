
import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/models/product_details_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _productDetailsInProgress = false;
  bool get productDetailsInProgress => _productDetailsInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProductDetailsModel? _productDetails;

  ProductDetailsModel? get productDetails => _productDetails;

  Future<bool> getProductDate(String productId) async {
    bool isSuccess = false;

    _productDetailsInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.productDetailsUrl(productId),
    );

    if (response.isSuccess) {
      _productDetails = ProductDetailsModel.formJson(
        response.responseBody['data'],
      );

      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _productDetailsInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
