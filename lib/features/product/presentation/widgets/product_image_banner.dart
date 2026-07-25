import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/features/shared/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductImageBanner extends StatefulWidget {
  const ProductImageBanner({super.key, required this.photos});

  final List<String> photos;

  @override
  State<ProductImageBanner> createState() => _ProductImageBannerState();
}

class _ProductImageBannerState extends State<ProductImageBanner> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
          ),
          items: widget.photos.map((photo) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AppNetworkImage(url: photo, fit: BoxFit.contain),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.photos.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == index ? AppColors.themeColor : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
