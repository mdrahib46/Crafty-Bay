import 'package:craftybay/features/product/presentation/providers/product_details_provider.dart';
import 'package:craftybay/features/product/presentation/screen/product_review_screen.dart';
import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  // final List _carouselItemList = [1, 2, 3, 4, 5, 6];
  // final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  // final List<String> _itemColor = ['Red', 'Blue', 'Black', 'Yellow', 'White'];
  // final List<String> _itemSize = ['S', 'M', 'L', 'XL', '2L'];

  final ProductDetailsProvider _productDetailsProvider =
      ProductDetailsProvider();

  @override
  void initState() {
    _productDetailsProvider.getProductDate(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider.value(
      value: _productDetailsProvider,
      child: Scaffold(
        appBar: AppBar(title: const Text('Product Details')),
        body: Consumer<ProductDetailsProvider>(
          builder: (context, _, _) {
            if (_productDetailsProvider.productDetailsInProgress) {
              return CenterCircularProgressIndicator();
            }

            if (_productDetailsProvider.errorMessage != null) {
              return Center(
                child: Text('${_productDetailsProvider.errorMessage}'),
              );
            }

            final productModel = _productDetailsProvider.productDetails!;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageBanner(photos: productModel.photos),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      productModel.title,
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
                                      maxCount: productModel.quantity,
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
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      Text(
                                        '${productModel.rating}',
                                        style: textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        ProductReviewScreen.name,
                                      );
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
                              Visibility(
                                visible: productModel.colors.isNotEmpty,
                                child: Column(
                                  children: [
                                    _buildSectionHeader('Colors'),
                                    const SizedBox(height: 8),
                                    ColorPicker(
                                      colors: productModel.colors,
                                      onChange: (String selectedColor) {
                                        print(selectedColor);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),

                              Visibility(
                                visible: productModel.size.isNotEmpty,
                                child: Column(
                                  children: [
                                    _buildSectionHeader('Size'),
                                    const SizedBox(height: 8),
                                    SizePicker(
                                      itemSize: productModel.size,
                                      onChange: (String selectedSize) {
                                        print(selectedSize);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),

                              Text('Description', style: textTheme.titleMedium),
                              const SizedBox(height: 8),
                              Text(
                                productModel.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                PriceAndAddToCartSection(),
              ],
            );
          },
        ),
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
