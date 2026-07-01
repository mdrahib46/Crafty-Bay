import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constant.dart';
import '../../../../app/asset_path.dart';
import '../../../shared/widgets/inc_dec_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Image.asset(AssetPath.dummyImage, width: 100),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,

                          children: [
                            Text(
                              'Title of the product',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Color: Red Size: XL',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppConstant.takaSign} 100',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.themeColor,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: IncDecButton(
                          maxCount: 20,
                          minCount: 1,
                          initialValue: 1,
                          onChange: (int value) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}