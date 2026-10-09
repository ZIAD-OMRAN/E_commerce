import 'package:dio/dio.dart';
import 'package:e_commerce/common/appConstants/constats.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioInject {
  @singleton
  Dio get getDio {
    Dio dio = Dio();
    BaseOptions baseoption = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      sendTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    );
    dio.options = baseoption;
    return dio;
  }
}
