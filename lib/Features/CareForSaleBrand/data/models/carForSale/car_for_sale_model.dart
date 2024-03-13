import 'package:json_annotation/json_annotation.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_image_model.dart';

part 'car_for_sale_model.g.dart';

@JsonSerializable()
class CarSaleItem {
  String id;
  int? carMake;
  int? carModel;
  int? year;
  int? cylinders;
  String? specifications;
  String? condition;
  String? location;
  String? exteriorColor;
  String? interiorColor;
  String? gearBox;
  String? fuelType;
  int? warranty;
  int? doors;
  String? regionalSpec;
  String? kilometer;
  int? price;
  int? whatsappNumber;
  @JsonKey(name: 'call_number')
  int? callNumber;
  @JsonKey(name: "user_id")
  int? userId;
  int? isAprove;
  int? isAds;
  String? createdAt;
  int? imagesId;
  List<CarImage>? images;

  CarSaleItem({
    required this.id,
    this.carMake,
    this.carModel,
    this.year,
    this.cylinders,
    this.specifications,
    this.condition,
    this.location,
    this.exteriorColor,
    this.interiorColor,
    this.gearBox,
    this.fuelType,
    this.warranty,
    this.doors,
    this.regionalSpec,
    this.kilometer,
    this.price,
    this.whatsappNumber,
    this.callNumber,
    this.userId,
    this.isAprove,
    this.isAds,
    this.createdAt,
    this.imagesId,
    this.images,
  });

  factory CarSaleItem.fromJson(Map<String, dynamic> json) =>
      _$CarSaleItemFromJson(json);

  Map<String, dynamic> toJson() => _$CarSaleItemToJson(this);
}

// @JsonSerializable()
// class CarImage {
//   String? imageName;

//   CarImage({
//     this.imageName,
//   });

//   factory CarImage.fromJson(Map<String, dynamic> json) =>
//       _$CarImageFromJson(json);

//   Map<String, dynamic> toJson() => _$CarImageToJson(this);
// }
