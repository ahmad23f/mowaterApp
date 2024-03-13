// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingServicesModel _$TrendingServicesModelFromJson(
        Map<String, dynamic> json) =>
    TrendingServicesModel(
      subTitle: json['subTitle'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      id: json['id'] as int,
      serviceId: json['service_id'] as int,
    );

Map<String, dynamic> _$TrendingServicesModelToJson(
        TrendingServicesModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'id': instance.id,
      'service_id': instance.serviceId,
      'title': instance.title,
      'subTitle': instance.subTitle,
    };
