// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingModel _$ParkingModelFromJson(Map<String, dynamic> json) => ParkingModel(
      image: json['image'] as String,
      name: json['name'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$ParkingModelToJson(ParkingModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
    };
