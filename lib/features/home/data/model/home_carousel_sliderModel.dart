class HomeCarouselSliderModel {
  String? sId;
  String? photoUrl;
  String? description;
  dynamic product;
  String? brand;
  dynamic category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  HomeCarouselSliderModel({
    this.sId,
    this.photoUrl,
    this.description,
    this.product,
    this.brand,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory HomeCarouselSliderModel.fromJson(Map<String, dynamic> jsonData) {
    return HomeCarouselSliderModel(
      sId: jsonData['_id'],
      photoUrl: jsonData['photo_url'],
      description: jsonData['description'],
      product: jsonData['product'],
      brand: jsonData['brand'],
      category: jsonData['category'],
      createdAt: jsonData['createdAt'],
      updatedAt: jsonData['updatedAt'],
      iV: jsonData['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['photo_url'] = photoUrl;
    data['description'] = description;
    data['product'] = product;
    data['brand'] = brand;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
