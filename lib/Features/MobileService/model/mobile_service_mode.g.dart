// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_service_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileServiceModel _$MobileServiceModelFromJson(Map<String, dynamic> json) =>
    MobileServiceModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      companyImage: json['company_image'] as String?,
      location: json['location'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      weekdayWork: (json['weekday_work'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      phoneNumber: json['phoneNumber'] as String?,
      whatsAppNumber: json['WhatsAppNumber'] as String?,
      mowaterDiscount: json['mowater_discount'] as int?,
      specialty: json['specialty'] as int?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      description: json['commercialLicenseNumber'] as String?,
      carMakes: json['carMakes'] as String?,
      approval: json['approval'] as int?,
      companyToken: json['companyToken'] as String?,
    );

Map<String, dynamic> _$MobileServiceModelToJson(MobileServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company_image': instance.companyImage,
      'location': instance.location,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'weekday_work': instance.weekdayWork,
      'phoneNumber': instance.phoneNumber,
      'WhatsAppNumber': instance.whatsAppNumber,
      'mowater_discount': instance.mowaterDiscount,
      'specialty': instance.specialty,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'commercialLicenseNumber': instance.description,
      'carMakes': instance.carMakes,
      'approval': instance.approval,
      'companyToken': instance.companyToken,
    };
