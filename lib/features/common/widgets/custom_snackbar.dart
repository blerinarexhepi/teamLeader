import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required String message,
    required VoidCallback onTap,
    super.key,
  }) : super(
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.whiteSmoke,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          dismissDirection: DismissDirection.horizontal,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: Text(
                  message,
                  style: const TextStyle(
                    height: 2,
                    fontSize: 14,
                    color: AppColors.charcoal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
}
