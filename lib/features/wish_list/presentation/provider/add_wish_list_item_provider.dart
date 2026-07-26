
import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';

class AddToWishlistItemProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successMsg;
  String? get successMsg => _successMsg;

  Future<bool> addWishListItem({required String itemId}) async {
    bool isSuccess = false;

    _isLoading = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "product": itemId,
    };

    final NetworkResponse response = await getNetworkCaller().postRequest(
      AppUrls.addWishListUrl,
      body: requestBody
    );

    if (response.isSuccess) {
      _successMsg = response.responseBody['msg'];
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
      _successMsg = null;
    }

    _isLoading = false;
    notifyListeners();

    return isSuccess;
  }
}
