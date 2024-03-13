// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parking_model.g.dart';

@JsonSerializable()
class ParkingModel {
  String name;
  int id;
  String image;
  ParkingModel({
    required this.image,
    required this.name,
    required this.id,
  });
  factory ParkingModel.fromJson(Map<String, dynamic> parkingModel) =>
      _$ParkingModelFromJson(parkingModel);
  Map<String, dynamic> toJson() => _$ParkingModelToJson(this);
}
