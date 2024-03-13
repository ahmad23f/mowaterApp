import 'package:json_annotation/json_annotation.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_image_model.dart';

part 'rental_cars_model.g.dart';

@JsonSerializable()
class RentCarModel {
  final String carMake;
  final String carModel;
  final int year;
  final int cylinders;
  final String exteriorColor;
  final String interiorColor;
  final String gearBox;
  final String fuelType;
  final String warranty;
  final int doors;
  final String regionalSpec;
  final String whatsappNumber;
  @JsonKey(name: 'call_number')
  final String callNumber;
  @JsonKey(name: 'user_id')
  final int userId;
  final int isAprove;
  final String createdAt;
  final int imagesId;
  final String extraInfo;
  final String dailyPrice;
  final String weeklyPrice;
  final String monthlyPrice;
  final String workingHours;
  final List<CarImage> images;
  RentCarModel({
    required this.images,
    required this.carMake,
    required this.carModel,
    required this.year,
    required this.cylinders,
    required this.exteriorColor,
    required this.interiorColor,
    required this.gearBox,
    required this.fuelType,
    required this.warranty,
    required this.doors,
    required this.regionalSpec,
    required this.whatsappNumber,
    required this.callNumber,
    required this.userId,
    required this.isAprove,
    required this.createdAt,
    required this.imagesId,
    required this.extraInfo,
    required this.dailyPrice,
    required this.weeklyPrice,
    required this.monthlyPrice,
    required this.workingHours,
  });

  factory RentCarModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarModelToJson(this);
}
