import 'package:e_commerce/common/network/failermodel.dart';
import 'package:e_commerce/common/network/network_respons.dart';
import 'package:e_commerce/features/auth/data/datasources/auth_datasource.dart';
import 'package:e_commerce/features/auth/data/datasources/local_data.dart';
import 'package:e_commerce/features/auth/data/mapper/usermapper.dart';
import 'package:e_commerce/features/auth/data/models/loginmodel/loginmodel.dart';

import 'package:e_commerce/features/auth/domain/entities/userentity.dart';
import 'package:e_commerce/features/auth/domain/repositories/repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Authrepository)
class AuthrepoImplemntation implements Authrepository {
  final AuthDatasource _authDatasource;
  final LocalData _localData;

  AuthrepoImplemntation({
    required AuthDatasource authDatasource,
    required this._localData,
  }) : _authDatasource = authDatasource;

  @override
  Future<Respons<void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Loginmodel Respons = await _authDatasource.login(
        email: email,
        password: password,
      );
      if (Respons.token != null) {
        _localData.setToken(Respons.token);
      }

      return Success(data: null);
    } catch (e) {
      return FalierResponse(failure: Failure.handleError(e));
    }
  }

  @override
  Future<Respons<void>> register({required UserEntity user}) async {
    try {
      Loginmodel respons = await _authDatasource.register(user: user.getmodel);
      return Success(data: null);
    } catch (e) {
      return FalierResponse(failure: Failure.handleError(e));
    }
  }

  @override
  Future<bool> checklogin() async {
    String? token = await _localData.getToken();
    return token != null;
  }
}
