import 'package:craftybay/features/shared/widgets/no_image.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius,
    this.fit,
  });

  final String url;
  final double? height, width, borderRadius;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorWidget: (context, url, error) => NoImage() ,
        progressIndicatorBuilder: (context, url, downloadInProgress)=> NoImage(),
      ),
    );
  }
}
