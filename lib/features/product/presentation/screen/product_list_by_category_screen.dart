import 'package:craftybay/features/shared/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/category_card.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });
  static const String name = '/product-list-by-category';

  final String categoryId;
  final String categoryName;

  @override
  State<ProductListByCategoryScreen> createState() =>
      _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState
    extends State<ProductListByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.categoryName)), body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 4,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCard());
        },
      ),
    ),);
  }
}
