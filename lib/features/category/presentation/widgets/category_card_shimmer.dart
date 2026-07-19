import 'package:flutter/material.dart';

class CategoryCardShimmer extends StatelessWidget {
  const CategoryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 10,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}