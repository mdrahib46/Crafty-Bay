// "_id": "6a61077d8e94bc61eeb778e2",
// "product": {
// "_id": "67c36a145e8a445235de1b75",
// "title": "Motorola Edge 50 Fusion",
// "description": "Motorola Edge 50 Fusion",
// "photos": [
// "https://owp.klarna.com/product/232x232/3146103049/Motorola-Edge-50-Fusion-8GB-RAM-256GB.jpg?ph=true"
// ],
// "colors": [],
// "sizes": [],
// "current_price": 12000,

// "total": 1,
// "first_page": null,
// "last_page": null

import '../../../product/data/models/product_model.dart';

class WishListModel extends ProductModel {
  WishListModel({
    required super.id,
    required super.title,
    required super.photos,
    required super.price,
    required super.rating,
  });

  factory WishListModel.formJson(Map<String, dynamic> jsonData) {
    return WishListModel(
      id: jsonData['_id'],
      title: jsonData['title'] ?? '',
      photos: List<String>.from(jsonData['photos']),
      price: jsonData['current_price'],
      rating: 4.5,
    );
  }
}
