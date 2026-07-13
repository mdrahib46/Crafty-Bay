import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.child,
  });

  final double? height, width;
  final double? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}
