// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginmodel _$LoginmodelFromJson(Map<String, dynamic> json) => Loginmodel(
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : Usermodel.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
);

Map<String, dynamic> _$LoginmodelToJson(Loginmodel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };
