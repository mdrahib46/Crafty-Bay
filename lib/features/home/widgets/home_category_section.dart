

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../category/presentation/widgets/category_card_shimmer.dart';
import '../../shared/presentation/providers/category_list_provider.dart';
import '../../shared/widgets/app_shimmer.dart';
import '../../shared/widgets/category_card.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoryListProvider>();
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: provider.isLoading
            ? 10
            : min(provider.categoryList.length, 10),
        itemBuilder: (context, index) {
          if (provider.isLoading) {
            return const AppShimmer(child: CategoryCardShimmer());
          }

          return CategoryCard(categoryModel: provider.categoryList[index]);
        },
        separatorBuilder: (_, _) => const SizedBox(width: 8),
      ),
    );
  }
}
