// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cars_model.g.dart';

@JsonSerializable()
class CarsBrandsModel {
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: "Agency")
  String agency;
  @JsonKey(name: "Car_country")
  String carCountry;

  CarsBrandsModel({
    required this.id,
    required this.name,
    required this.agency,
    required this.carCountry,
  });
  factory CarsBrandsModel.fromJson(Map<String, dynamic> json) =>
      _$CarsBrandsModelFromJson(json);
  Future<Map<String, dynamic>> toJson() async => _$CarsBrandsModelToJson(this);
}
