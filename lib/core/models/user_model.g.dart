// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      joinedFrom: json['joinedFrom'] == null
          ? null
          : DateTime.parse(json['joinedFrom'] as String),
      nickName: json['nickName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      whatsAppNumber: json['whatsAppNumber'] as String?,
      token: json['token'] as String?,
      image: json['image'] as String?,
      commercialLicenesNumber: json['commercialLicenesNumber'] as String?,
      description: json['description'] as String?,
      mowaterDiscount: json['mowaterDiscount'] as int?,
      specialtyCategorys: json['specialtyCategorys'] as String?,
      workDays: json['workDays'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      location: json['location'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      attachment: json['attachment'] as String?,
      availableProducts: json['availableProducts'] as int?,
      subscriptionState: json['subscriptionState'] as String?,
      carMakes: json['carMakes'] as String?,
      whatsAppVerificationCode: json['whatsAppVerificationCode'] as String?,
      phoneNumberVerificationCode:
          json['phoneNumberVerificationCode'] as String?,
      emailVerificationCode: json['emailVerificationCode'] as String?,
      lastUpdatePhone: json['lastUpdatePhone'] == null
          ? null
          : DateTime.parse(json['lastUpdatePhone'] as String),
      lastUpdateWhatsAppNumber: json['lastUpdateWhatsAppNumber'] == null
          ? null
          : DateTime.parse(json['lastUpdateWhatsAppNumber'] as String),
      emailState: json['emailState'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'password': instance.password,
      'joinedFrom': instance.joinedFrom?.toIso8601String(),
      'nickName': instance.nickName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'token': instance.token,
      'image': instance.image,
      'commercialLicenesNumber': instance.commercialLicenesNumber,
      'description': instance.description,
      'mowaterDiscount': instance.mowaterDiscount,
      'specialtyCategorys': instance.specialtyCategorys,
      'workDays': instance.workDays,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'attachment': instance.attachment,
      'availableProducts': instance.availableProducts,
      'subscriptionState': instance.subscriptionState,
      'carMakes': instance.carMakes,
      'whatsAppVerificationCode': instance.whatsAppVerificationCode,
      'phoneNumberVerificationCode': instance.phoneNumberVerificationCode,
      'emailVerificationCode': instance.emailVerificationCode,
      'lastUpdatePhone': instance.lastUpdatePhone?.toIso8601String(),
      'lastUpdateWhatsAppNumber':
          instance.lastUpdateWhatsAppNumber?.toIso8601String(),
      'emailState': instance.emailState,
    };
