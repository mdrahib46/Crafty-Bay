import 'package:flutter/Material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';

class DeleteCartItemProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _deletingItemId;
  String? get deletingItemId => _deletingItemId;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _successMessage;
  String? get successMessage => _successMessage;

  Future<bool> deleteCartItem(String itemId) async {
    bool isSuccess = false;

    _isLoading = true;

    _deletingItemId = itemId;

    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().deleteRequest(
      AppUrls.deleteCartItemUrl(itemId),
    );

    if (response.isSuccess) {
      _successMessage = response.responseBody['msg'];
      _errorMessage = null;
      isSuccess = true;
    } else {
      _successMessage = null;
      _errorMessage = response.errorMessage;
    }

    _isLoading = false;

    _deletingItemId = null;

    notifyListeners();

    return isSuccess;
  }
}
