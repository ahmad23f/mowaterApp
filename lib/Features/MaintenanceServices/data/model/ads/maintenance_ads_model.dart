// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'maintenance_ads_model.g.dart';

@JsonSerializable()
class MaintenanceAdsModel {
  String? image;
  String? title;
  String? descreption;
  @JsonKey(name: "category_id")
  int? categoryId;
  MaintenanceAdsModel({
    required this.image,
    required this.title,
    required this.descreption,
    required this.categoryId,
  });
  factory MaintenanceAdsModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceAdsModelFromJson(json);
  Map<String, dynamic> fromJson(MaintenanceAdsModel adsModel) =>
      _$MaintenanceAdsModelToJson(this);
}
