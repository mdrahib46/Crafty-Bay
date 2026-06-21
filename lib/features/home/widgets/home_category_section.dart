import 'package:flutter/material.dart';

import '../../shared/widgets/category_card.dart';


class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8,);
        },
      ),
    );
  }
}