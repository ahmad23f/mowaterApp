// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_providers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceProvidersModel _$InsuranceProvidersModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceProvidersModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      phoneNumber: json['phoneNmber'] as String,
      whatsAppNumber: json['whatsAppNumber'] as String,
      mowaterDiscount: json['mowaterDiscount'] as int,
      providerType: json['provider_type'] as int,
    );

Map<String, dynamic> _$InsuranceProvidersModelToJson(
        InsuranceProvidersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'phoneNmber': instance.phoneNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'mowaterDiscount': instance.mowaterDiscount,
      'provider_type': instance.providerType,
    };
