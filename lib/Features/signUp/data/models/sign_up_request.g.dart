// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

signUpRequestModel _$signUpRequestModelFromJson(Map<String, dynamic> json) =>
    signUpRequestModel(
      confiermPasswrod: json['confiermPasswrod'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      joinedFrom: DateTime.parse(json['joinedFrom'] as String),
      image: json['image'] as String,
    );

Map<String, dynamic> _$signUpRequestModelToJson(signUpRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'joinedFrom': instance.joinedFrom.toIso8601String(),
      'email': instance.email,
      'confiermPasswrod': instance.confiermPasswrod,
      'image': instance.image,
      'password': instance.password,
    };
