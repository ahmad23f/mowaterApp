// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceAdsModel _$MaintenanceAdsModelFromJson(Map<String, dynamic> json) =>
    MaintenanceAdsModel(
      image: json['image'] as String?,
      title: json['title'] as String?,
      descreption: json['descreption'] as String?,
      categoryId: json['category_id'] as int?,
    );

Map<String, dynamic> _$MaintenanceAdsModelToJson(
        MaintenanceAdsModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'descreption': instance.descreption,
      'category_id': instance.categoryId,
    };
