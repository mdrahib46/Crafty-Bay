
import 'package:craftybay/features/cart/presentation/data/model/add_to_cart_params.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _addToCartInProgress = false;
  bool get addToCartInProgress => _addToCartInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart({required AddToCartParams addToCardParams}) async {
    bool isSuccess = false;

    _addToCartInProgress = true;
    notifyListeners();
    final NetworkResponse response = await getNetworkCaller().postRequest(
      AppUrls.addToCartUrl,
      body: addToCardParams.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _addToCartInProgress = false;
    notifyListeners();

    return isSuccess;
  }


  // int getTotalPrice(){
  //   int total = 0;
  //   for(CartItemModel item in _cartItemList){
  //     total += item.productModel.price * item.quantity;
  //   }
  //
  //   return total;
  // }
  //
  // void updateCartItemQuantity(String cartItemId, int quantity){
  //   for(CartItemModel item in _cartItemList){
  //     if(item.id == cartItemId){
  //       item.quantity = quantity;
  //       break;
  //     }
  //   }
  //
  //   notifyListeners();
  // }
}
