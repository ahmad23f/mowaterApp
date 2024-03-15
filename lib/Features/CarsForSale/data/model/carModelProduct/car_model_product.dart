import 'package:json_annotation/json_annotation.dart';
import 'package:Mowater/Features/CarsForSale/data/model/carModelProduct/car_image_model.dart';

part 'car_model_product.g.dart'; // Generated file

@JsonSerializable()
class CarProduct {
  String id;
  String carMake;
  String carModel;
  int year;
  int cylinders;
  String condition;
  String location;
  String? exteriorColor;
  String interiorColor;
  String gearBox;
  String fuelType;
  int warranty;
  int doors;
  String kilometer;
  int price;
  @JsonKey(name: 'whatsappNumber')
  int whatsappNumber;
  @JsonKey(name: 'call_number')
  int callNumber;
  @JsonKey(name: "user_id")
  int userId;
  int isAprove;
  int isAds;
  String createdAt;
  int? imagesId;
  String? extraInfo;
  List<CarImage> images;
  int? showRoomId;

  String? specifications;

  CarProduct(
      {required this.showRoomId,
      required this.extraInfo,
      required this.id,
      required this.carMake,
      required this.carModel,
      required this.year,
      required this.cylinders,
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
      required this.whatsappNumber,
      required this.callNumber,
      required this.userId,
      required this.isAprove,
      required this.isAds,
      required this.createdAt,
      required this.imagesId,
      required this.images,
      required this.specifications});

  factory CarProduct.fromJson(Map<String, dynamic> json) =>
      _$CarProductFromJson(json);

  Map<String, dynamic> toJson() => _$CarProductToJson(this);
}
