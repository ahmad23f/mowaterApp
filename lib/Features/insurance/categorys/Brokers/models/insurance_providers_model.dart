import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insurance_providers_model.g.dart';

@JsonSerializable()
class InsuranceProvidersModel {
  int id;
  String name;
  String image;
  @JsonKey(name: 'start_time')
  String startTime;
  @JsonKey(name: 'end_time')
  String endTime;
  @JsonKey(name: 'phoneNmber')
  String phoneNumber;
  @JsonKey(name: 'whatsAppNumber')
  String whatsAppNumber;
  @JsonKey(name: 'mowaterDiscount')
  int mowaterDiscount;
  @JsonKey(name: 'provider_type')
  int providerType;

  InsuranceProvidersModel({
    required this.id,
    required this.name,
    required this.image,
    required this.startTime,
    required this.endTime,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.mowaterDiscount,
    required this.providerType,
  });

  factory InsuranceProvidersModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceProvidersModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceProvidersModelToJson(this);
}
