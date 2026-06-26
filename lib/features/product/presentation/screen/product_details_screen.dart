import 'package:craftybay/features/product/presentation/widgets/selectable_chip_button.dart';
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
  final List<Color> _itemColor = [
    Colors.green,
    Colors.blue,
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.yellow,
  ];
  final List<String> _itemSize = ['S', 'M', 'L', 'XL', 'XXL'];
  final ValueNotifier<int> _selectedColor = ValueNotifier(0);
  final ValueNotifier<int> _selectedSize = ValueNotifier(0);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductQtySelector(),
                Row(
                  spacing: 16,
                  children: [
                    Text(
                      '\$ 100',
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
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
                const SizedBox(height: 10),
                Text(
                  'Colors',
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
                ValueListenableBuilder<int>(
                  valueListenable: _selectedColor,
                  builder: (context, selectedIndex, _) {
                    return SelectableButton<Color>(
                      items: _itemColor,
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        _selectedColor.value = index;
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  'Size',
                  style: textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
                ValueListenableBuilder<int>(
                  valueListenable: _selectedSize,
                  builder: (context, selectedIndex, _) {
                    return SelectableButton<String>(
                      items: _itemSize,
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        _selectedSize.value = index;
                      },
                    );
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
