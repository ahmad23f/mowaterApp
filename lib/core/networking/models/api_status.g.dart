// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusApiResponse _$StatusApiResponseFromJson(Map<String, dynamic> json) =>
    StatusApiResponse(
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$StatusApiResponseToJson(StatusApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
