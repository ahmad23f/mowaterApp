// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      passwrod: json['passwrod'] as String?,
      emailState: json['email_state'] as int?,
      emailVerifedCode: json['email_verification_code'] as String?,
      whatsappVerified: json['whatsappVerified'] as int?,
      whatsappNumber: json['whatsappNumber'] as String?,
      nickname: json['nickname'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      joinedFrom: json['joinedFrom'] as String?,
      verified: json['verified'] as int?,
      image: json['image'] as String?,
      userToken: json['user_token'] as String?,
      lastUpdatePhoneNumber: json['last_update_phone_number'] == null
          ? null
          : DateTime.parse(json['last_update_phone_number'] as String),
      lastUpdateWhatsAppNumber: json['last_whatsapp_number_update'] == null
          ? null
          : DateTime.parse(json['last_whatsapp_number_update'] as String),
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'joinedFrom': instance.joinedFrom,
      'verified': instance.verified,
      'image': instance.image,
      'user_token': instance.userToken,
      'nickname': instance.nickname,
      'whatsappNumber': instance.whatsappNumber,
      'whatsappVerified': instance.whatsappVerified,
      'last_update_phone_number':
          instance.lastUpdatePhoneNumber?.toIso8601String(),
      'last_whatsapp_number_update':
          instance.lastUpdateWhatsAppNumber?.toIso8601String(),
      'email_verification_code': instance.emailVerifedCode,
      'email_state': instance.emailState,
      'passwrod': instance.passwrod,
      'userType': instance.userType,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
    };
