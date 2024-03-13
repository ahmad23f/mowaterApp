// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_categorys_model.g.dart';

@JsonSerializable()
class MainCategorysModel {
  @JsonKey(name: "category_icon")
  String icon;
  @JsonKey(name: 'category_name')
  String name;
  @JsonKey(name: "category_id")
  int id;
  MainCategorysModel({
    required this.id,
    required this.icon,
    required this.name,
  });
  factory MainCategorysModel.fromJson(Map<String, dynamic> json) =>
      _$MainCategorysModelFromJson(json);

  Map<String, dynamic> toJson(MainCategorysModel mainCategorysModel) =>
      _$MainCategorysModelToJson(this);
}
