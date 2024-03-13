// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelPriceModel _$FuelPriceModelFromJson(Map<String, dynamic> json) =>
    FuelPriceModel(
      fuelPrices: (json['FuelPrice'] as List<dynamic>)
          .map((e) => FuelPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdate: DateTime.parse(json['last_update'] as String),
    );

Map<String, dynamic> _$FuelPriceModelToJson(FuelPriceModel instance) =>
    <String, dynamic>{
      'FuelPrice': instance.fuelPrices,
      'last_update': instance.lastUpdate.toIso8601String(),
    };

FuelPrice _$FuelPriceFromJson(Map<String, dynamic> json) => FuelPrice(
      id: json['id'] as int,
      fuelType: json['fuel_type'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$FuelPriceToJson(FuelPrice instance) => <String, dynamic>{
      'id': instance.id,
      'fuel_type': instance.fuelType,
      'price': instance.price,
    };
