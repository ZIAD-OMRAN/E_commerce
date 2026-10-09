import 'package:e_commerce/common/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;

  final String textdata;

  final IconData? icon;

  final String? Function(String?)? validator;

  final TextEditingController? controller;

  final bool isPassword;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textdata,
    this.icon,
    this.validator,
    this.controller,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.textdata,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          TextFormField(
            controller: widget.controller,

            obscureText: widget.isPassword && isPasswordHidden,

            validator: widget.validator,

            decoration: InputDecoration(
              filled: true,
              hintText: widget.hintText,

              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.primaryColor,
                      ),
                    )
                  : widget.icon != null
                  ? Icon(widget.icon, color: Colors.white)
                  : null,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),

              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12.r),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
