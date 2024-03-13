// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_update_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInformationResponse _$UpdateUserInformationResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInformationResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserInformationResponseToJson(
        UpdateUserInformationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
    };
