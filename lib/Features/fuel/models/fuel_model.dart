import 'package:json_annotation/json_annotation.dart';

part 'fuel_model.g.dart';

@JsonSerializable()
class FuelPriceModel {
  @JsonKey(name: 'FuelPrice')
  final List<FuelPrice> fuelPrices;
  @JsonKey(name: 'last_update')
  final DateTime? lastUpdate;

  FuelPriceModel({required this.fuelPrices, required this.lastUpdate});

  factory FuelPriceModel.fromJson(Map<String, dynamic> json) =>
      _$FuelPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$FuelPriceModelToJson(this);
}

@JsonSerializable()
class FuelPrice {
  final int id;
  @JsonKey(name: 'fuel_type')
  final String fuelType;
  final double price;

  FuelPrice({required this.id, required this.fuelType, required this.price});

  factory FuelPrice.fromJson(Map<String, dynamic> json) =>
      _$FuelPriceFromJson(json);

  Map<String, dynamic> toJson() => _$FuelPriceToJson(this);
}
