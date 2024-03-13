// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'api_status.g.dart';

@JsonSerializable()
class StatusApiResponse {
  String status;
  String message;
  StatusApiResponse({
    required this.status,
    required this.message,
  });
  factory StatusApiResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StatusApiResponseToJson(this);
}
