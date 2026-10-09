import 'package:e_commerce/common/di/di.dart';
import 'package:e_commerce/common/them.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/pages/loginpage.dart';
import 'package:e_commerce/features/auth/presentation/pages/register.dart';
import 'package:e_commerce/features/auth/presentation/pages/splach.dart';
import 'package:e_commerce/features/home/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => getIt<AuthCubit>()..CheckIsLogedin(),
          child: MaterialApp(
            initialRoute: Splach.routename,
            routes: {
              Loginpage.routename: (context) => Loginpage(),
              Register.routename: (context) => Register(),
              Homepage.routename: (context) => Homepage(),
              Splach.routename: (context) => Splach(),
            },
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: ThemeMode.light,
            theme: AppTheme.lightTheme,
          ),
        );
      },
    );
  }
}
