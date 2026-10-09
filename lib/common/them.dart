import 'package:e_commerce/common/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        size: 25.w,
        color: AppColors.primaryColor,
      ),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      secondary: AppColors.strokeColor,
    ),

    brightness: Brightness.light,
  );
}
