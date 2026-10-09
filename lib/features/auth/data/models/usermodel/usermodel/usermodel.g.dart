// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usermodel _$UsermodelFromJson(Map<String, dynamic> json) => Usermodel(
  name: json['name'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  role: json['role'] as String?,
  rePassword: json['rePassword'] as String?,
);

Map<String, dynamic> _$UsermodelToJson(Usermodel instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'rePassword': instance.rePassword,
};
