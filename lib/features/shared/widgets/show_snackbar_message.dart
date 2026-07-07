import 'package:craftybay/app/app_colors.dart';
import 'package:flutter/material.dart';

void showSnackBarMessage(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError
          ? Colors.red
          : AppColors.themeColor.withValues(alpha: 0.15),
      content: Text(message, style: TextStyle(color: Colors.white)),
    ),
  );
}
