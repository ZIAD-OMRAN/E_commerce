import 'package:e_commerce/common/appcolors.dart';
import 'package:e_commerce/common/register_controller.dart';
import 'package:e_commerce/common/validators.dart';
import 'package:e_commerce/features/auth/domain/entities/userentity.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/pages/loginpage.dart';
import 'package:e_commerce/features/auth/presentation/widgets/buttoin.dart';
import 'package:e_commerce/features/auth/presentation/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static String routename = 'Register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final controllers = RegisterControllers();
  @override
  void initState() {
    super.initState();
    controllers.passwordController;
    controllers.emailController;
    controllers.nameController;
    controllers.phoneController;
  }

  @override
  void dispose() {
    super.dispose();
    controllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,

        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 240.h,
                child: Image.asset('assets/images/logo.png'),
              ),

              CustomTextFormField(
                hintText: 'enter your name',
                textdata: 'Full Name',
                controller: controllers.nameController,
                validator: AppValidators.name,
              ),
              CustomTextFormField(
                hintText: 'enter your Mobile Number',
                textdata: 'Mobile Number',
                controller: controllers.phoneController,
                validator: AppValidators.phone,
              ),
              CustomTextFormField(
                hintText: 'enter your mail address',
                textdata: 'E-mail address',
                controller: controllers.emailController,
                validator: AppValidators.email,
              ),
              CustomTextFormField(
                hintText: 'enter your Password',
                textdata: 'Password',
                controller: controllers.passwordController,
                validator: AppValidators.password,
                isPassword: true,
              ),

              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  } else if (state is Registerfailer) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failure.errorMessage)),
                    );
                  } else if (state is RegisterSuccess) {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                      context,
                      Loginpage.routename,
                    );
                  }
                },
                child: Buttoin(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      context.read<AuthCubit>().register(UserEntity(name: controllers.nameController.text, email: controllers.emailController.text, password: controllers.passwordController.text, phone: controllers.phoneController.text));
                    }
                  },
                  data: 'Sing Up',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
