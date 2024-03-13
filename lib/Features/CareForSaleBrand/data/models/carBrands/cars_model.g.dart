// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarsBrandsModel _$CarsBrandsModelFromJson(Map<String, dynamic> json) =>
    CarsBrandsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      agency: json['Agency'] as String,
      carCountry: json['Car_country'] as String,
    );

Map<String, dynamic> _$CarsBrandsModelToJson(CarsBrandsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'Agency': instance.agency,
      'Car_country': instance.carCountry,
    };
