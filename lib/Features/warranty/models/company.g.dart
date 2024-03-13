// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantyCompanyModel _$WarrantyCompanyModelFromJson(
        Map<String, dynamic> json) =>
    WarrantyCompanyModel(
      companyId: json['companyId'] as int,
      companyImage: json['companyImage'] as String,
      name: json['name'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      phoneNumber: json['phoneNumber'] as String,
      whatsAppNumber: json['whatsAppNumber'] as String,
      weekdays:
          (json['weekdays'] as List<dynamic>).map((e) => e as String).toList(),
      createAccountAt: json['createAccountAt'] as String,
      location: json['location'] as String,
      mowaterDiscount: json['mowaterDiscount'] as int,
    );

Map<String, dynamic> _$WarrantyCompanyModelToJson(
        WarrantyCompanyModel instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'companyImage': instance.companyImage,
      'name': instance.name,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'phoneNumber': instance.phoneNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'weekdays': instance.weekdays,
      'createAccountAt': instance.createAccountAt,
      'location': instance.location,
      'mowaterDiscount': instance.mowaterDiscount,
    };
