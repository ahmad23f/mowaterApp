import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@JsonSerializable()
class Car {
  int id;
  String carMake;
  String carModel;
  int year;
  int cylinders;
  String specifications;
  String condition;
  String location;
  String exteriorColor;
  String interiorColor;
  String gearBox;
  String fuelType;
  int warranty;
  int doors;
  String kilometer;
  int price;
  int imagesId;
  @JsonKey(name: 'wahts_number')
  int whatsappNumber;
  @JsonKey(name: 'call_number')
  int phoneNumber;
  @JsonKey(name: 'user_id')
  int userId;
  int isAprove;
  int isAds;
  DateTime createdAt;

  Car({
    required this.createdAt,
    required this.id,
    required this.carMake,
    required this.carModel,
    required this.year,
    required this.cylinders,
    required this.specifications,
    required this.condition,
    required this.location,
    required this.exteriorColor,
    required this.interiorColor,
    required this.gearBox,
    required this.fuelType,
    required this.warranty,
    required this.doors,
    required this.kilometer,
    required this.price,
    required this.imagesId,
    required this.whatsappNumber,
    required this.phoneNumber,
    required this.userId,
    required this.isAprove,
    required this.isAds,
  });

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}
