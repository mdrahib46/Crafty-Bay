import 'package:craftybay/features/cart/presentation/data/model/cart_item_model.dart';
import 'package:craftybay/features/cart/presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constant.dart';
import '../../../../app/asset_path.dart';
import '../../../shared/widgets/inc_dec_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              getProductPhoto(cartItemModel.productModel.photos),
              fit: BoxFit.cover,
              errorBuilder: (context, _, _) {
                return Image.asset(
                  width: 100,
                  AssetPath.noImage,
                  fit: BoxFit.cover,
                );
              },
              width: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,

                          children: [
                            Text(
                              cartItemModel.productModel.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                if (cartItemModel.color != null)
                                  Text(
                                    'Color: ${cartItemModel.color}',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                const SizedBox(width: 4),
                                if (cartItemModel.color != null)
                                  Text(
                                    'Size: ${cartItemModel.size}',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          /// TODO: Delete Cart Item using API
                        },
                        icon: Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppConstant.takaSign} ${cartItemModel.productModel.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.themeColor,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: IncDecButton(
                          maxCount: cartItemModel.productModel.quantity,
                          minCount: 1,
                          initialValue: cartItemModel.quantity,
                          onChange: (int value) {
                            context
                                .read<CartListProvider>()
                                .updateCartItemQuantity(
                                  cartItemModel.id,
                                  value,
                                );
                          },
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

  String getProductPhoto(List<String> photo) {
    if (photo.isEmpty) {
      return '';
    }
    return photo.first;
  }
}
