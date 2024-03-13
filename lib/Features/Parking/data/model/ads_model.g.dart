// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingAdModel _$ParkingAdModelFromJson(Map<String, dynamic> json) =>
    ParkingAdModel(
      id: json['id'] as int,
      image: json['image'] as String,
      category_id: json['category_id'] as int,
      parkingEmirateName: json['parking_emirate_name'] as String,
    );

Map<String, dynamic> _$ParkingAdModelToJson(ParkingAdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'category_id': instance.category_id,
      'parking_emirate_name': instance.parkingEmirateName,
    };
