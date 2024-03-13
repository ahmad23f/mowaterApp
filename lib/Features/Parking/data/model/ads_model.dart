import 'package:freezed_annotation/freezed_annotation.dart';
part 'ads_model.g.dart';

@JsonSerializable()
class ParkingAdModel {
  int id;
  String image;
  int category_id;
  @JsonKey(name: 'parking_emirate_name')
  String parkingEmirateName;
  ParkingAdModel({
    required this.id,
    required this.image,
    required this.category_id,
    required this.parkingEmirateName,
  });

  factory ParkingAdModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingAdModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ParkingAdModelToJson(this);
}
