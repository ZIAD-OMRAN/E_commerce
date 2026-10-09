import 'package:e_commerce/features/auth/presentation/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountnavv extends StatelessWidget {
  const CreateAccountnavv({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Register.routename);
          },
          child: Text(
            ' Create Account',
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}
