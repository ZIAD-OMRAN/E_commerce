//TODO : di ,return type

import 'package:e_commerce/common/network/network_respons.dart';
import 'package:e_commerce/features/auth/domain/repositories/repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final Authrepository _authrepository;

  LoginUsecase({required Authrepository authrepository})
    : _authrepository = authrepository;

  Future<Respons<void>> call({
    required String email,
    required String password,
  }) async => await _authrepository.login(password: password, email: email);
}
