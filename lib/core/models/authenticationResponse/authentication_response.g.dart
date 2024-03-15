// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatinResponse _$AuthenticatinResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticatinResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticatinResponseToJson(
        AuthenticatinResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
    };
