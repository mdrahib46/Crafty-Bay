

import 'package:flutter/material.dart';


import '../../../../app/app_colors.dart';
import '../../../../app/app_constant.dart';

class TotalPriceAndCheckoutSection extends StatefulWidget {
  const TotalPriceAndCheckoutSection({
    super.key,
  });

  @override
  State<TotalPriceAndCheckoutSection> createState() => _TotalPriceAndCheckoutSectionState();
}

class _TotalPriceAndCheckoutSectionState extends State<TotalPriceAndCheckoutSection> {

  // final AddToCartProvider _addToCartProvider = AddToCartProvider();


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
              Text('Total Price '),
              Text(
                '${AppConstant.takaSign}100.00',
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
            child: FilledButton(
              onPressed: () {},
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
