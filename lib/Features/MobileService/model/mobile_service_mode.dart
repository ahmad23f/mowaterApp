import 'package:json_annotation/json_annotation.dart';

part 'mobile_service_mode.g.dart';

@JsonSerializable()
class MobileServiceModel {
  int? id;
  String? name;
  @JsonKey(name: 'company_image')
  String? companyImage;
  String? location;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'weekday_work')
  List<String>? weekdayWork;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'WhatsAppNumber')
  String? whatsAppNumber;
  @JsonKey(name: 'mowater_discount')
  int? mowaterDiscount;
  int? specialty;
  String? latitude;
  String? longitude;
  @JsonKey(name: 'commercialLicenseNumber')
  String? description;
  @JsonKey(name: 'carMakes')
  String? carMakes;
  int? approval;
  @JsonKey(name: 'companyToken')
  String? companyToken;

  MobileServiceModel(
      {this.id,
      this.name,
      this.companyImage,
      this.location,
      this.startTime,
      this.endTime,
      this.weekdayWork,
      this.phoneNumber,
      this.whatsAppNumber,
      this.mowaterDiscount,
      this.specialty,
      this.latitude,
      this.longitude,
      this.description,
      this.carMakes,
      this.approval,
      this.companyToken});

  factory MobileServiceModel.fromJson(Map<String, dynamic> json) =>
      _$MobileServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MobileServiceModelToJson(this);
}
