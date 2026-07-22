class AddToCartParams {
  final String productID;
  final String? color;
  final String? size;
  final int quantity;

  AddToCartParams({
    required this.productID,
    required this.quantity,
    this.color,
    this.size,

  });

  Map<String, dynamic> toJson() {
    final jsonData = {
      'product': productID,
      'quantity': quantity,
    };

    if(color != null){
      jsonData['color'] = color!;
    }
    if(size != null){
      jsonData['size'] = size!;
    }

    return  jsonData;
  }
}
