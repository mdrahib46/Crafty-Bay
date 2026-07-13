import 'package:cache_network_media/cache_network_media.dart';
import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
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
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      // child: CachedNetworkImage(
      //   imageUrl: url,
      //   width: width,
      //   height: height,
      //   fit: fit ?? BoxFit.cover,
      //   errorWidget: (context, url, error) => NoImage() ,
      //   progressIndicatorBuilder: (context, url, downloadInProgress)=> NoImage(),
      // ),
      child: CacheNetworkMediaWidget.img(
        url: url,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        placeholder: CenterCircularProgressIndicator(),
        // errorBuilder: (context, error, _)=> NoImage(),
      ),
    );
  }
}
