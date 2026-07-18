
import 'package:flutter/material.dart';





class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
  });

  // final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          // return CategoryCard(categoryModel: categoryModel);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8,);
        },
      ),
    );
  }
}