import 'package:carousel_slider/carousel_slider.dart';
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
          items: widget.photos.map((photo) {
            return Builder(
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(60),
                    image: DecorationImage(image: NetworkImage(photo)),
                  ),

                );
              }
            );
          }).toList(),
          options: CarouselOptions(
            height: 220,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
          ),
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
