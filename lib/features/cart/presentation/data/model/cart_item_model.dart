// "_id": "6a611b748e94bc61eeb77912",
// "product": {
// "_id": "67d714a7623818b018e22fc5",
// "title": "title",
// "photos": [],
// "colors": [],
// "sizes": [],
// "tags": [],
// "current_price": 50,
// "quantity": 1,
// },
// "quantity": 1,
// "color": null,
// "size": null,


import '../../../../product/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel productModel;
  int quantity;
  final String? color;
  final String? size;

  CartItemModel({
    required this.id,
    required this.productModel,
    required this.quantity,
    required this.color,
    required this.size,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CartItemModel(
      id: jsonData['_id'],
      productModel: ProductModel.formJson(jsonData['product']),
      quantity: jsonData['quantity'],
      color: jsonData['color'],
      size: jsonData['size'],
    );
  }
}
