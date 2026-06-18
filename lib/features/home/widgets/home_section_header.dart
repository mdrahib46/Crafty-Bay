import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';



class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text('See All', style: TextStyle(color: AppColors.themeColor)),
        ),
      ],
    );
  }
}