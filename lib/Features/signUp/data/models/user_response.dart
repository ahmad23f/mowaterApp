import 'package:json_annotation/json_annotation.dart';
import 'package:mowaterApp/core/services/user_type.dart';

// This annotation is required for the code generation part
part 'user_response.g.dart';

// Define the user class
@JsonSerializable()
class UserModel {
  final String? name;
  final String? email;
  final int? id;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String? joinedFrom;
  final int? verified;
  final String? image;
  @JsonKey(name: 'user_token')
  final String? userToken;
  final String? nickname;
  final String? whatsappNumber;
  final int? whatsappVerified;
  @JsonKey(name: 'last_update_phone_number')
  final DateTime? lastUpdatePhoneNumber;
  @JsonKey(name: 'last_whatsapp_number_update')
  final DateTime? lastUpdateWhatsAppNumber;
  @JsonKey(name: 'email_verification_code')
  final String? emailVerifedCode;
  @JsonKey(name: 'email_state')
  final int? emailState;
  final String? passwrod;
  final String? userType;
  UserModel(
      {this.passwrod,
      this.emailState,
      this.emailVerifedCode,
      this.whatsappVerified,
      this.whatsappNumber,
      this.nickname,
      this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.joinedFrom,
      this.verified,
      this.image,
      this.userToken,
      this.lastUpdatePhoneNumber,
      this.lastUpdateWhatsAppNumber,
      required this.userType});

  // Factory method to deserialize JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Method to serialize to JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

// Define the response class
@JsonSerializable()
class UserResponse {
  final String status;
  final String message;
  final UserModel? user;

  UserResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  // Factory method to deserialize JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  // Method to serialize to JSON
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
