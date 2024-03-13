// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'trending_service.g.dart';

@JsonSerializable()
class TrendingServicesModel {
  String image;
  int id;
  @JsonKey(name: "service_id")
  int serviceId;
  String title;
  String subTitle;
  TrendingServicesModel({
    required this.subTitle,
    required this.title,
    required this.image,
    required this.id,
    required this.serviceId,
  });
  factory TrendingServicesModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingServicesModelFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingServicesModelToJson(this);
}
