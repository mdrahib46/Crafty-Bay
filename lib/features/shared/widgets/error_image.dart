import 'package:craftybay/app/asset_path.dart';
import 'package:flutter/material.dart';


class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPath.noImage
    );
  }
}