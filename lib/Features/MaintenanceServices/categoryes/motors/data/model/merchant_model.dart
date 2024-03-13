import 'package:json_annotation/json_annotation.dart';

part 'merchant_model.g.dart';

@JsonSerializable()
class MerchantModel {
  @JsonKey(name: 'merchant_id')
  final int? merchantId;

  @JsonKey(name: 'companyName')
  final String? companyName;

  @JsonKey(name: 'workStarted')
  final String? workStarted;

  @JsonKey(name: 'workEnd')
  final String? workEnd;

  @JsonKey(name: 'experinceYears')
  final String? experienceYears;

  @JsonKey(name: 'carSpecialized')
  final int? carSpecialized;

  @JsonKey(name: 'imagCompany')
  final String? imageCompany;

  @JsonKey(name: 'phoneNumber')
  final int? phoneNumber;

  @JsonKey(name: 'maintenaanceServicesCategories_id')
  final int? maintenanceServicesCategoryId;

  @JsonKey(name: 'name')
  final String? categoryName;

  MerchantModel({
    required this.merchantId,
    required this.companyName,
    required this.workStarted,
    required this.workEnd,
    required this.experienceYears,
    required this.carSpecialized,
    required this.imageCompany,
    required this.phoneNumber,
    required this.maintenanceServicesCategoryId,
    required this.categoryName,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantModelFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantModelToJson(this);
}
