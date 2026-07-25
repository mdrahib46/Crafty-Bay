class ProductReviewModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? photoUrl;
  final String comment;

  ProductReviewModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.comment,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductReviewModel(
      id: jsonData['_id'],
      firstName: jsonData['user']['first_name'],
      lastName: jsonData['user']['last_name'],
      photoUrl: jsonData['user']['avatar_url'],
      comment: jsonData['comment'],
    );
  }
}
