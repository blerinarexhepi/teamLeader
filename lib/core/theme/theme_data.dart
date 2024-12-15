import 'package:flutter/material.dart';
import 'package:teamleader/core/colors/colors.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Figtree',
  dividerTheme: const DividerThemeData(color: AppColors.gainsboro),
  colorScheme: const ColorScheme.light(
    background: AppColors.solitude,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      height: 1,
      fontSize: 10,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w400,
      color: AppColors.darkGreen,
    ),
    bodyMedium: TextStyle(
      height: 1,
      fontSize: 12,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w400,
      color: AppColors.darkGreen,
    ),
    bodyLarge: TextStyle(
      height: 1,
      fontSize: 14,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w400,
      color: AppColors.darkGreen,
    ),
    labelSmall: TextStyle(
      height: 1,
      fontSize: 12,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w500,
      color: AppColors.darkGreen,
    ),
    labelMedium: TextStyle(
      height: 1,
      fontSize: 14,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w500,
      color: AppColors.darkGreen,
    ),
    labelLarge: TextStyle(
      height: 1,
      fontSize: 16,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w500,
      color: AppColors.darkGreen,
    ),
    titleSmall: TextStyle(
      height: 1,
      fontSize: 18,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w500,
      color: AppColors.darkGreen,
    ),
    titleMedium: TextStyle(
      height: 0,
      fontSize: 24,
      fontFamily: 'Figtree-darkGreen',
      color: AppColors.darkGreen,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      height: 1,
      fontSize: 32,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w500,
      color: AppColors.darkGreen,
    ),
    headlineSmall: TextStyle(
      height: 1,
      fontSize: 18,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w600,
      color: AppColors.darkGreen,
    ),
    headlineMedium: TextStyle(
      height: 1,
      fontSize: 24,
      fontFamily: 'Figtree',
      fontWeight: FontWeight.w600,
      color: AppColors.darkGreen,
    ),
  ),
);
