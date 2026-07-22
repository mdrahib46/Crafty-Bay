
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constant.dart';
import '../../../cart/presentation/provider/add_to_cart_provider.dart';
import '../../../shared/widgets/center_circular_progress_indicator.dart';

class PriceAndAddToCartSection extends StatefulWidget {
  const PriceAndAddToCartSection({
    super.key, required this.onTapAddToCart,
  });

  final VoidCallback onTapAddToCart;

  @override
  State<PriceAndAddToCartSection> createState() => _PriceAndAddToCartSectionState();
}

class _PriceAndAddToCartSectionState extends State<PriceAndAddToCartSection> {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: AppColors.themeColor.withAlpha(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price '),
              Text(
                '${AppConstant.takaSign}100',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: Consumer<AddToCartProvider>(
              builder: (context, addToCartProvider, _) {

                if(addToCartProvider.addToCartInProgress){
                  return CenterCircularProgressIndicator();
                }

                return FilledButton(
                  onPressed: widget.onTapAddToCart,
                  child: Text('Add to Cart'),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
