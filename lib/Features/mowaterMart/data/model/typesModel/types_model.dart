// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types_model.g.dart';

@JsonSerializable()
class TypesModel {
  int? c_id;
  String? c_name;
  String? c_icon;
  int? c_category;
  TypesModel({
    required this.c_id,
    required this.c_name,
    required this.c_icon,
    required this.c_category,
  });
  factory TypesModel.fromJson(Map<String, dynamic> json) =>
      _$TypesModelFromJson(json);
  Map<String, dynamic> toJson(TypesModel typesModel) =>
      _$TypesModelToJson(this);
}
