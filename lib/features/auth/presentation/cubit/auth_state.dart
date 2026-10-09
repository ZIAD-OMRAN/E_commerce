part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class Authfailer extends AuthState {
  final Failure failure;

  Authfailer({required this.failure});
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class Registerfailer extends AuthState {
  final Failure failure;

  Registerfailer({required this.failure});
}

class CheckLogedin extends AuthState {
  final bool isloged; 

  CheckLogedin({required this.isloged});
}
