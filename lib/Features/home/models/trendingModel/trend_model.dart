// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'trend_model.g.dart';

@JsonSerializable()
class TrendingModel {
  int id;
  String title;
  String descreption;
  String image;
  DateTime create_at;
  int product_id;
  TrendingModel({
    required this.id,
    required this.title,
    required this.descreption,
    required this.image,
    required this.create_at,
    required this.product_id,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingModelFromJson(json);
  Map<String, dynamic> toJson(TrendingModel trendingModel) =>
      _$TrendingModelToJson(this);
}
