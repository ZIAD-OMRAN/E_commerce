import 'package:e_commerce/features/auth/domain/repositories/repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class UserCaching {
  final Authrepository _authrepository;

  UserCaching({required this._authrepository});
  Future<bool> call() => _authrepository.checklogin();
}
