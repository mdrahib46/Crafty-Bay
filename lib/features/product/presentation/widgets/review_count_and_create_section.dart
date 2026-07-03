
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../screen/create_review_screen.dart';

class ReviewCountAndCreateSection extends StatelessWidget {
  const ReviewCountAndCreateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: AppColors.themeColor.withAlpha(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Reviews ',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '(1000)',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, CreateReviewScreen.name);
            },
            child: Icon(Icons.add, ),
          ),
        ],
      ),
    );
  }
}
