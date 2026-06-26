
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../widgets/product_image_banner.dart';
import '../widgets/product_qty_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/Product-Details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List _carouselItemList = [1, 2, 3, 4, 5, 6];
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          ProductImageBanner(
            carouselItemList: _carouselItemList,
            currentIndex: _currentIndex,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProductQtySelector(),
                Row(
                  spacing: 16,
                  children: [
                    Text('\$ 100', style: textTheme.bodyLarge!.copyWith(color: AppColors.themeColor)),
                    Wrap(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Text('4.5'),
                      ],
                    ),
                    Container(
                      padding: .all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.themeColor,
                      ),
                      child: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
