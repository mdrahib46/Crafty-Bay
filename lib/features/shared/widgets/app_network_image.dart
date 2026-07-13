import 'package:cache_network_media/cache_network_media.dart';
import 'package:craftybay/features/shared/widgets/app_shimmer.dart';
// import 'package:craftybay/features/shared/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';


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
      child: CacheNetworkMediaWidget.img(
        url: url,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        placeholder: AppShimmer(),
        errorBuilder: (context, errorImage, stackTrace)=> Icon(Icons.image),
      ),
      // child: Image.network(url),
    );
  }
}
