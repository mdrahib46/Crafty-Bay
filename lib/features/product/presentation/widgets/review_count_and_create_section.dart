import 'package:craftybay/app/controller/auth_controller.dart';
import 'package:craftybay/app/crafty_bay_app.dart';
import 'package:craftybay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../providers/products_review_provider.dart';
import '../screen/create_review_screen.dart';

class ReviewCountAndCreateSection extends StatelessWidget {
  const ReviewCountAndCreateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final totalReview = context
        .read<ProductsReviewProvider>()
        .reviewList
        .length;
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
                '($totalReview})',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: _moveToCreateReviewScreen,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _moveToCreateReviewScreen() async{
    if (await AuthController.isUserLoggedIn() == false) {
      Navigator.pushNamed(
        CraftyBayApp.navigatorKey.currentContext!,
        SignInScreen.name,
      );
    }

    Navigator.pushNamed(
      CraftyBayApp.navigatorKey.currentContext!,
      CreateReviewScreen.name,
    );
  }
}
