// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_brands_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModelsBrand _$CarModelsBrandFromJson(Map<String, dynamic> json) =>
    CarModelsBrand(
      name: json['name'] as String,
      carBrandName: json['car_brand_name'] as String,
      fuelTank: json['Fuel Tank'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$CarModelsBrandToJson(CarModelsBrand instance) =>
    <String, dynamic>{
      'name': instance.name,
      'car_brand_name': instance.carBrandName,
      'Fuel Tank': instance.fuelTank,
      'id': instance.id,
    };
