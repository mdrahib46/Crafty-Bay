import 'package:flutter/material.dart';

import '../../../../app/get_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../data/model/cart_item_model.dart';

class CartListProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<CartItemModel> _cartItemList = [];
  List<CartItemModel> get cartItemList => _cartItemList;

  Future<bool> getCartListData() async {
    bool isSuccess = false;

    _isLoading = true;
    notifyListeners();

    List<CartItemModel> list = [];

    final NetworkResponse response = await getNetworkCaller().getRequest(
      AppUrls.cartListUrl,
    );
    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData
          in response.responseBody['data']['results']) {
        list.add(CartItemModel.fromJson(jsonData));
      }
      _cartItemList = list;

      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isLoading = false;
    notifyListeners();

    return isSuccess;
  }


  int getTotalPrice(){
    int total = 0;
    for(CartItemModel item in _cartItemList){
      total += item.productModel.price * item.quantity;
    }

    return total;
  }

  void updateCartItemQuantity(String cartItemId, int quantity){
    for(CartItemModel item in _cartItemList){
      if(item.id == cartItemId){
        item.quantity = quantity;
        break;
      }
    }

    notifyListeners();
  }
}
