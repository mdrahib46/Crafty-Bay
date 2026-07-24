// {
// "_id": "6812588dea40bfc6edc673ed",
// "title": "সহজ ভাষায় অ্যালগরিদম",
//"photos": [
// "https://ds.rokomari.store/rokomari110/ProductNew20190903/260X372/Sohoj_Bhashay_Algorithm-Ihsanul_Islam-ab6e3-227461.jpg"
// ],

// "current_price": 258,
//



class ProductModel {
  final String id;
  final String title;
  final List<String> photos;
  final int price;
  final int quantity;
  final double rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.photos,
    required this.price,
    required this.quantity,
    required this.rating,
  });

  factory ProductModel.formJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      photos: List.from(jsonData['photos']),
      price: jsonData['current_price'],
      quantity: jsonData['quantity'],
      rating: 4.5,
    );
  }
}
