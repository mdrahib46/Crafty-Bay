import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeCarouselShimmer extends StatelessWidget {
  const HomeCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
