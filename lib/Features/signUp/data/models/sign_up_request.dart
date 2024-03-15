// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class signUpRequestModel {
  String name;
  String phoneNumber;
  DateTime joinedFrom;
  String email;
  String confiermPasswrod;
  String image;
  String password;

  signUpRequestModel({
    required this.confiermPasswrod,
    required this.password,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.joinedFrom,
    required this.image,
  });

  factory signUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$signUpRequestModelFromJson(json);
  Map<String, dynamic> toJson(signUpRequestModel loginRequestModel) =>
      _$signUpRequestModelToJson(this);
}
