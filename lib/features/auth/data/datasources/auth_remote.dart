import 'package:e_commerce/features/auth/data/api/auth_api.dart';
import 'package:e_commerce/features/auth/data/datasources/auth_datasource.dart';
import 'package:e_commerce/features/auth/data/models/loginmodel/loginmodel.dart';
import 'package:e_commerce/features/auth/data/models/usermodel/usermodel/usermodel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDatasource)
class AuthRemote implements AuthDatasource {
 final AuthApi _authApi;

  new({required this._authApi}); //TODO : di
  @override
  Future<Loginmodel> login({
    required String password,
    required String email,
  }) async {
    Loginmodel respons = await _authApi.login({
      'email': email,
      'password': password,
    });
    return respons;
  }

  @override
  Future<Loginmodel> register({required Usermodel user}) async {
    Loginmodel response = await _authApi.register(user);
    return response;
  }
}
