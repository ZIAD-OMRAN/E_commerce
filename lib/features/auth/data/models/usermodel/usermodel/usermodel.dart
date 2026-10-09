import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usermodel.g.dart';

@JsonSerializable()
class Usermodel {
  String? name;
  String? email;
  String? password;
 @JsonKey(includeToJson: false ,includeFromJson: true) String? role;
  String? rePassword;

  Usermodel({
    this.name,
    this.email,
    this.password,
    this.role,
    this.rePassword,
  });

  @override
  String toString() {
    return 'Usermodel(name: $name, email: $email, password: $password, rePassword: $rePassword, )';
  }

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return _$UsermodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UsermodelToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Usermodel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      role.hashCode ^
      rePassword.hashCode;
}
