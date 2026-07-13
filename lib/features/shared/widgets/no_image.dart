import 'package:craftybay/app/asset_path.dart';
import 'package:flutter/material.dart';


class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPath.noImage
    );
  }
}