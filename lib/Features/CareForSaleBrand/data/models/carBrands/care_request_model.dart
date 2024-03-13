import 'package:freezed_annotation/freezed_annotation.dart';
part 'care_request_model.g.dart';

@JsonSerializable()
class CareModelRequest {
  @JsonKey(name: 'dbname')
  String brandName;
  CareModelRequest({required this.brandName});
  factory CareModelRequest.fromModel(Map<String, dynamic> json) =>
      _$CareModelRequestFromJson(json);
  Map<String, dynamic> toJson(CareModelRequest careModelRequest) =>
      _$CareModelRequestToJson(this);
}
