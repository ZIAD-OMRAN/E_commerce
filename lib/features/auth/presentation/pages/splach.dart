import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/pages/loginpage.dart';
import 'package:e_commerce/features/home/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splach extends StatelessWidget {
  const Splach({super.key});
  static const String routename = 'Splach';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is CheckLogedin) {
            if (state.isloged) {
              Navigator.pushReplacementNamed(context, Homepage.routename);
            }else{
              Navigator.pushReplacementNamed(context, Loginpage.routename);
            }
          }
        },
        child: Image.asset('assets/images/splach.png', fit: BoxFit.fill),
      ),
    );
  }
}
