import 'package:json_annotation/json_annotation.dart';

part 'car_car_model.g.dart';

@JsonSerializable()
class CarCareModel {
  final int id;
  final String name;
  @JsonKey(name: 'company_image')
  final String companyImage;
  final String location;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  @JsonKey(name: 'weekday_work')
  final List<String> weekdayWork;
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'WhatsAppNumber')
  final String whatsAppNumber;
  @JsonKey(name: 'mowater_discount')
  final int mowaterDiscount;
  @JsonKey(name: 'category_id')
  final int categoryId;

  CarCareModel({
    required this.id,
    required this.name,
    required this.companyImage,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.weekdayWork,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.mowaterDiscount,
    required this.categoryId,
  });

  factory CarCareModel.fromJson(Map<String, dynamic> json) =>
      _$CarCareModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarCareModelToJson(this);
}
