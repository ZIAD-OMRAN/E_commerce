import 'package:e_commerce/features/auth/data/models/loginmodel/loginmodel.dart';
import 'package:e_commerce/features/auth/data/models/usermodel/usermodel/usermodel.dart';

abstract class AuthDatasource {
  Future<Loginmodel> login({required String password, required String email});
  Future<Loginmodel> register({
  required Usermodel user
  });
}
