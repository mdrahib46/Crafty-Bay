
import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../../../app/asset_path.dart';
import '../../product/presentation/screen/product_details_screen.dart';



class ProductCard extends StatelessWidget {
  const ProductCard({super.key, });


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        elevation: 2,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(30),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Image.asset(AssetPath.dummyImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title of the Product ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ 100', style: textTheme.bodyLarge),
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
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
