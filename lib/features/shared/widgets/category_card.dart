import 'package:craftybay/features/product/presentation/screen/product_list_by_category_screen.dart';
import 'package:craftybay/features/shared/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListByCategoryScreen.name,
          arguments: {'categoryId': categoryModel.id, 'categoryName': categoryModel.title},
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withAlpha(20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryModel.icon,
              width: 48,
              height: 48,
              errorBuilder: (_,_,_){
                return Icon(Icons.error_outline, size: 48, color: Colors.red,);
              },
            )
          ),
          const SizedBox(height: 4),
          Text(
            categoryModel.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: .w500, color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }
}
