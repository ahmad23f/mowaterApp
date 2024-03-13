// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_number_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateNumberRsponse _$UpdateNumberRsponseFromJson(Map<String, dynamic> json) =>
    UpdateNumberRsponse(
      status: json['status'] as String,
      message: json['message'] as String,
      whatsappVerified: json['whatsappVerified'] as int,
      phoneVerified: json['phoneVerified'] as int,
    );

Map<String, dynamic> _$UpdateNumberRsponseToJson(
        UpdateNumberRsponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'whatsappVerified': instance.whatsappVerified,
      'phoneVerified': instance.phoneVerified,
    };
