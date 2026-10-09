import 'package:bloc/bloc.dart';
import 'package:e_commerce/common/network/failermodel.dart';
import 'package:e_commerce/common/network/network_respons.dart';
import 'package:e_commerce/features/auth/domain/entities/userentity.dart';
import 'package:e_commerce/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/register_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/user_caching.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this._loginUsecase,
    required this._registerUsecase,
    required this._userCaching,
  }) : super(AuthInitial());

  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final UserCaching _userCaching;

  login(String password, String emial) async {
    emit(AuthLoading());
    final respons = await _loginUsecase(email: emial, password: password);
    switch (respons) {
      case Success():
        emit(AuthSuccess());
      case FalierResponse():
        emit(Authfailer(failure: respons.failure));
    }
  }

  register(UserEntity user) async {
    emit(RegisterLoading());
    Respons<void> respons = await _registerUsecase(user: user);

    switch (respons) {
      case Success():
        emit(RegisterSuccess());
      case FalierResponse():
        emit(Registerfailer(failure: respons.failure));
    }
  }

  CheckIsLogedin() async {
    await Future.delayed(Duration(seconds: 5));
    bool isloged = await _userCaching();
    emit(CheckLogedin(isloged: isloged));
  }
}
