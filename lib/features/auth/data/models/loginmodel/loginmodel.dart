import 'package:collection/collection.dart';
import 'package:e_commerce/features/auth/data/models/usermodel/usermodel/usermodel.dart';
import 'package:json_annotation/json_annotation.dart';


part 'loginmodel.g.dart';

@JsonSerializable()
class Loginmodel {
  final String? message;
  final Usermodel? user;
  final String? token;

  const Loginmodel({this.message, this.user, this.token});

  @override
  String toString() {
    return 'Loginmodel(message: $message, user: $user, token: $token)';
  }

  factory Loginmodel.fromJson(Map<String, dynamic> json) {
    return _$LoginmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginmodelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Loginmodel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ user.hashCode ^ token.hashCode;
}
