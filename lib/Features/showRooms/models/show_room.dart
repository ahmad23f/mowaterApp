import 'package:json_annotation/json_annotation.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';

part 'show_room.g.dart';

@JsonSerializable()
class ShowroomModel {
  int id;
  String name;
  String days;
  String location;
  int mowaterDiscount;
  int callNumber;
  int whatsAppNumber;
  String descreption;
  int avilableCars;
  String startTime;
  String endTime;
  String? latitude;
  String? longitude;
  @JsonKey(name: 'company_image')
  String showRommImage;
  String? specifications;
  @JsonKey(name: 'cars')
  List<CarProduct> cars;

  ShowroomModel({
    required this.latitude,
    required this.longitude,
    required this.showRommImage,
    required this.specifications,
    required this.id,
    required this.name,
    required this.days,
    required this.location,
    required this.mowaterDiscount,
    required this.callNumber,
    required this.whatsAppNumber,
    required this.descreption,
    required this.avilableCars,
    required this.startTime,
    required this.endTime,
    required this.cars,
  });

  factory ShowroomModel.fromJson(Map<String, dynamic> json) =>
      _$ShowroomModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowroomModelToJson(this);
}
