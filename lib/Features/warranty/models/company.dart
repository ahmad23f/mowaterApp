import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class WarrantyCompanyModel {
  final int companyId;
  final String companyImage;
  final String name;
  final String startTime;
  final String endTime;
  final String phoneNumber;
  final String whatsAppNumber;
  final List<String> weekdays;
  final String createAccountAt;
  final String location;
  final int mowaterDiscount;

  WarrantyCompanyModel({
    required this.companyId,
    required this.companyImage,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.weekdays,
    required this.createAccountAt,
    required this.location,
    required this.mowaterDiscount,
  });

  factory WarrantyCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$WarrantyCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarrantyCompanyModelToJson(this);
}
