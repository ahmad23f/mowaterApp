// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantModel _$MerchantModelFromJson(Map<String, dynamic> json) =>
    MerchantModel(
      merchantId: json['merchant_id'] as int?,
      companyName: json['companyName'] as String?,
      workStarted: json['workStarted'] as String?,
      workEnd: json['workEnd'] as String?,
      experienceYears: json['experinceYears'] as String?,
      carSpecialized: json['carSpecialized'] as int?,
      imageCompany: json['imagCompany'] as String?,
      phoneNumber: json['phoneNumber'] as int?,
      maintenanceServicesCategoryId:
          json['maintenaanceServicesCategories_id'] as int?,
      categoryName: json['name'] as String?,
    );

Map<String, dynamic> _$MerchantModelToJson(MerchantModel instance) =>
    <String, dynamic>{
      'merchant_id': instance.merchantId,
      'companyName': instance.companyName,
      'workStarted': instance.workStarted,
      'workEnd': instance.workEnd,
      'experinceYears': instance.experienceYears,
      'carSpecialized': instance.carSpecialized,
      'imagCompany': instance.imageCompany,
      'phoneNumber': instance.phoneNumber,
      'maintenaanceServicesCategories_id':
          instance.maintenanceServicesCategoryId,
      'name': instance.categoryName,
    };
