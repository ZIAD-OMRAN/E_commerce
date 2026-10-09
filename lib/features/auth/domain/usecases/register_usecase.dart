//TODO : di ,return type


import 'package:e_commerce/common/network/network_respons.dart';

import 'package:e_commerce/features/auth/domain/entities/userentity.dart';
import 'package:e_commerce/features/auth/domain/repositories/repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUsecase {
  final Authrepository _authrepository;

  RegisterUsecase({required Authrepository authrepository})
    : _authrepository = authrepository;

  Future<Respons<void>> call({
    required UserEntity user
  }) => _authrepository.register(user: user);
}
