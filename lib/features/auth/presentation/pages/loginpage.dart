import 'package:e_commerce/common/appcolors.dart';
import 'package:e_commerce/common/login_controller.dart';
import 'package:e_commerce/common/validators.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/buttoin.dart';
import 'package:e_commerce/features/auth/presentation/widgets/create_accountnavv.dart';
import 'package:e_commerce/features/auth/presentation/widgets/customtextfield.dart';
import 'package:e_commerce/features/home/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  static String routename = 'Loginpage';

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final controllers = LoginControllers();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllers.emialController;
    controllers.passwordController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 260.h,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Text(
                  'Welcome Back To Route',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Please sign in with your mail',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),

                CustomTextFormField(
                  hintText: 'enter your email',
                  textdata: 'User email',
                  controller: controllers.emialController,
                  validator: AppValidators.email,
                ),
                CustomTextFormField(
                  hintText: 'enter your Password',
                  textdata: 'Password',
                  controller: controllers.passwordController,
                  validator: AppValidators.password,
                  isPassword: true,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0).h,
                  child: Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    } else if (state is Authfailer) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.failure.errorMessage)),
                      );
                    } else if (state is AuthSuccess) {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                        context,
                        Homepage.routename,
                      );
                    }
                  },
                  child: Buttoin(
                    data: 'Login',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          controllers.passwordController.text,
                          controllers.emialController.text,
                        );
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20).h,
                  child: CreateAccountnavv(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
