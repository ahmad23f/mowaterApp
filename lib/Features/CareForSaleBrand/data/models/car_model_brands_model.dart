// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'car_model_brands_model.g.dart';

@JsonSerializable()
class CarModelsBrand {
  String name;

  @JsonKey(name: 'car_brand_name')
  String carBrandName;
  @JsonKey(name: 'Fuel Tank')
  String fuelTank;
  int id;
  CarModelsBrand({
    required this.name,
    required this.carBrandName,
    required this.fuelTank,
    required this.id,
  });
  factory CarModelsBrand.fromJson(Map<String, dynamic> jsFromJson) =>
      _$CarModelsBrandFromJson(jsFromJson);
  Map<String, dynamic> toJson(CarModelsBrand carModelsBrand) =>
      _$CarModelsBrandToJson(this);
}
