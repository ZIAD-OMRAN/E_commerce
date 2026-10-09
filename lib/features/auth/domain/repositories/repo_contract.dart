import 'package:e_commerce/common/network/network_respons.dart';
import 'package:e_commerce/features/auth/domain/entities/userentity.dart';

abstract class Authrepository {
  Future<Respons<void>> login({
    required String password,
    required String email,
  });
  Future<Respons<void>> register({required UserEntity user});

  Future<bool> checklogin();
}
