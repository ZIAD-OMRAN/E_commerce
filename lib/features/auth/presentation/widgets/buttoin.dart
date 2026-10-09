import 'package:e_commerce/common/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttoin extends StatelessWidget {
  const Buttoin({this.onTap, this.data, super.key});
  final void Function()? onTap;
  final String? data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30).h,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          alignment: AlignmentGeometry.center,
          child: Text(
            data!,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
