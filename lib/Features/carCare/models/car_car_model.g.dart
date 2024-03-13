// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarCareModel _$CarCareModelFromJson(Map<String, dynamic> json) => CarCareModel(
      id: json['id'] as int,
      name: json['name'] as String,
      companyImage: json['company_image'] as String,
      location: json['location'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      weekdayWork: (json['weekday_work'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      phoneNumber: json['phoneNumber'] as String,
      whatsAppNumber: json['WhatsAppNumber'] as String,
      mowaterDiscount: json['mowater_discount'] as int,
      categoryId: json['category_id'] as int,
    );

Map<String, dynamic> _$CarCareModelToJson(CarCareModel instance) =>
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
      'category_id': instance.categoryId,
    };
