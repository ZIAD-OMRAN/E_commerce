import 'package:e_commerce/common/network/failermodel.dart';

sealed class Respons<T> {}

class Success<T> extends Respons<T> {
  final T data;
  Success({required this.data});
}

class FalierResponse<T> extends Respons<T> {
  final Failure failure;
  FalierResponse({required this.failure});
}
