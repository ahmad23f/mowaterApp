import 'package:Mowater/core/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticatinResponse {
  String status;
  String message;
  UserModel? user;
  AuthenticatinResponse(
      {required this.status, required this.message, this.user});
  factory AuthenticatinResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatinResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticatinResponseToJson(this);
}
