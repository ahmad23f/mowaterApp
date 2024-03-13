import 'package:freezed_annotation/freezed_annotation.dart';
part "mowater_mart_request_model.g.dart";

@JsonSerializable()
class MowaterMartProductRequest {
  @JsonKey(name: "category_id")
  int id;
  MowaterMartProductRequest(this.id);
  factory MowaterMartProductRequest.fromJson(Map<String, dynamic> json) =>
      _$MowaterMartProductRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MowaterMartProductRequestToJson(this);
}
