// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companyes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceCompanyModel _$MaintenanceCompanyModelFromJson(
        Map<String, dynamic> json) =>
    MaintenanceCompanyModel(
      mowaterDiscount: json['mowaterDiscount'] as int?,
      latitude: json['latitude'] as String?,
      carBrands: (json['car_brands'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      approval: json['approval'] as int?,
      longitude: json['longitude'] as String?,
      carMakes: json['carMakes'] as String?,
      categoryName: json['category_name'] as String?,
      image: json['company_image'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      weekdayWork: json['weekday_work'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      specialty: json['specialty'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      whatsappNumber: json['WhatsAppNumber'] as String?,
    );

Map<String, dynamic> _$MaintenanceCompanyModelToJson(
        MaintenanceCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weekday_work': instance.weekdayWork,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'specialty': instance.specialty,
      'description': instance.description,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'WhatsAppNumber': instance.whatsappNumber,
      'company_image': instance.image,
      'category_name': instance.categoryName,
      'car_brands': instance.carBrands,
      'approval': instance.approval,
      'mowaterDiscount': instance.mowaterDiscount,
      'carMakes': instance.carMakes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
