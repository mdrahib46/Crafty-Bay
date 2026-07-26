
import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';

class DeleteWishListItemProvider extends ChangeNotifier {
  bool _itemInProgress = false;
  bool get itemInProgress => _itemInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successMsg;
  String? get successMsg => _successMsg;

  Future<bool> deleteWishListItem(String itemId) async {
    bool isSuccess = false;

    _itemInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().deleteRequest(
      AppUrls.deleteWishListItem(itemId),
    );

    if (response.isSuccess) {
      _successMsg = response.responseBody['msg'];
      isSuccess = true;

      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _itemInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
