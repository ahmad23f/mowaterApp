// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionCompanyModel _$InspectionCompanyModelFromJson(
        Map<String, dynamic> json) =>
    InspectionCompanyModel(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      mowaterDiscount: json['mowater_discount'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      companyImage: json['company_image'] as String,
      location: json['location'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      specialty: json['specialty'] as String,
      weekdayWork:
          (json['weekdays'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      phoneNumber: json['phoneNumber'] as String,
      whatsAppNumber: json['WhatsAppNumber'] as String,
      brandNames: (json['brand_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InspectionCompanyModelToJson(
        InspectionCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company_image': instance.companyImage,
      'location': instance.location,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'specialty': instance.specialty,
      'weekdays': instance.weekdayWork,
      'description': instance.description,
      'phoneNumber': instance.phoneNumber,
      'WhatsAppNumber': instance.whatsAppNumber,
      'brand_names': instance.brandNames,
      'mowater_discount': instance.mowaterDiscount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
