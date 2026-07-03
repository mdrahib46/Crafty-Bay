import 'package:craftybay/features/product/presentation/screen/product_review_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/widgets/inc_dec_button.dart';
import '../widgets/color_picker.dart';
import '../widgets/price_and_cart_section.dart';
import '../widgets/product_image_banner.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static const String name = '/Product-Details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List _carouselItemList = [1, 2, 3, 4, 5, 6];
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final List<String> _itemColor = ['Red', 'Blue', 'Black', 'Yellow', 'White'];
  final List<String> _itemSize = ['S', 'M', 'L', 'XL', '2L'];

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
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                Text('4.5', style: textTheme.bodyLarge),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ProductReviewScreen.name);
                              },
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
                        _buildSectionHeader('Colors'),
                        const SizedBox(height: 8),
                        ColorPicker(
                          colors: _itemColor,
                          onChange: (String selectedColor) {
                            print(selectedColor);
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildSectionHeader('Size'),
                        const SizedBox(height: 8),
                        SizePicker(
                          itemSize: _itemSize,
                          onChange: (String selectedSize) {
                            print(selectedSize);
                          },
                        ),
                        const SizedBox(height: 16),
                        Text('Description', style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                          'This is a high-quality product perfect for the New Year season. Enjoy exclusive discounts and premium features. Lightweight, durable, and stylish.',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            ),
          ),
          PriceAndAddToCartSection(),

        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade700,
      ),
    );
  }
}
