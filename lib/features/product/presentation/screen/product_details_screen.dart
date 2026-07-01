import 'package:craftybay/features/product/presentation/widgets/selectable_chip_button.dart';
import 'package:craftybay/features/shared/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../cart/presentation/widgets/total_price_and_checkout_section.dart';
import '../widgets/product_image_banner.dart';

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
  final List<String> _itemSize = ['S', 'M', 'L', 'XL', '2L'];
  final ValueNotifier<int> _selectedColor = ValueNotifier(0);
  final ValueNotifier<int> _selectedSize = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Happy New Year Special Deal - Save 30%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 90,
                              child: IncDecButton(
                                maxCount: 20,
                                minCount: 1,
                                initialValue: 1,
                                onChange: (int value) {},
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Wrap(
                              spacing: 4,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 20),
                                Text('4.5', style: textTheme.bodyLarge),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Review',
                                style: TextStyle(
                                  color: AppColors.themeColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.themeColor,
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text('Colors', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        ValueListenableBuilder<int>(
                          valueListenable: _selectedColor,
                          builder: (context, selectedIndex, _) {
                            return SelectableButton<Color>(
                              items: _itemColor,
                              selectedIndex: selectedIndex,
                              onSelected: (index) => _selectedColor.value = index,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text('Size', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        ValueListenableBuilder<int>(
                          valueListenable: _selectedSize,
                          builder: (context, selectedIndex, _) {
                            return SelectableButton<String>(
                              items: _itemSize,
                              selectedIndex: selectedIndex,
                              onSelected: (index) => _selectedSize.value = index,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text('Description', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                          'This is a high-quality product perfect for the New Year season. Enjoy exclusive discounts and premium features. Lightweight, durable, and stylish.',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          TotalPriceAndCheckoutSection(),
        ],
      ),
    );
  }
}
