// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';

part 'response_update_user.g.dart';

@JsonSerializable()
class UpdateUserInformationResponse {
  String status;
  String message;
  UserModel user;
  UpdateUserInformationResponse({
    required this.status,
    required this.message,
    required this.user,
  });
  factory UpdateUserInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInformationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserInformationResponseToJson(this);
}
