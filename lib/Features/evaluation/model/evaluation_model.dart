import 'package:json_annotation/json_annotation.dart';

part 'evaluation_model.g.dart';

@JsonSerializable()
class EvaluationModel {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'year')
  String year;

  @JsonKey(name: 'specifications')
  String specifications;

  @JsonKey(name: 'condition')
  String condition;

  @JsonKey(name: 'warranty')
  String warranty;

  @JsonKey(name: 'kilometer')
  String kilometer;

  @JsonKey(name: 'extraInfo')
  String extraInfo;

  @JsonKey(name: 'phoneNumber')
  String phoneNumber;

  @JsonKey(name: 'whatsappNumber')
  String whatsappNumber;

  @JsonKey(name: 'user')
  String user;

  EvaluationModel({
    required this.id,
    required this.year,
    required this.specifications,
    required this.condition,
    required this.warranty,
    required this.kilometer,
    required this.extraInfo,
    required this.phoneNumber,
    required this.whatsappNumber,
    required this.user,
  });

  factory EvaluationModel.fromJson(Map<String, dynamic> json) =>
      _$EvaluationModelFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluationModelToJson(this);
}
