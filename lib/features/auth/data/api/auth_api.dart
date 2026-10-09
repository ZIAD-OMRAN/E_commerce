import 'package:dio/dio.dart';
import 'package:e_commerce/common/appConstants/constats.dart';
import 'package:e_commerce/features/auth/data/models/loginmodel/loginmodel.dart';
import 'package:e_commerce/features/auth/data/models/usermodel/usermodel/usermodel.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@injectable
@RestApi()
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;
  @POST(AppConstants.login)
  Future<Loginmodel> login(@Body() Map<String, dynamic> map);

  @POST(AppConstants.singup)
  Future<Loginmodel> register(@Body() Usermodel user);
}
