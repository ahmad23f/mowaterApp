import 'package:json_annotation/json_annotation.dart';

part 'inspection_company_model.g.dart'; // This is the generated file

@JsonSerializable()
class InspectionCompanyModel {
  final int id;
  final String name;
  @JsonKey(name: 'company_image')
  final String companyImage;
  final String location;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  final String specialty;
  @JsonKey(name: 'weekdays')
  final List<String> weekdayWork;
  final String description;
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'WhatsAppNumber')
  final String whatsAppNumber;
  @JsonKey(name: 'brand_names')
  final List<String> brandNames;
  @JsonKey(name: 'mowater_discount')
  final int mowaterDiscount;
  final String latitude;
  final String longitude;

  InspectionCompanyModel({
    required this.latitude,
    required this.longitude,
    required this.mowaterDiscount,
    required this.id,
    required this.name,
    required this.companyImage,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.specialty,
    required this.weekdayWork,
    required this.description,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.brandNames,
  });

  factory InspectionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$InspectionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$InspectionCompanyModelToJson(this);
}
