// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_insurance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarInsuranceModel _$CarInsuranceModelFromJson(Map<String, dynamic> json) =>
    CarInsuranceModel(
      carMake: json['carMake'] as int,
      carModel: json['carModel'] as int,
      carYear: DateTime.parse(json['carYear'] as String),
      carPrice: json['carPrice'] as String,
      type: json['type'] as String,
      phoneNumber: json['phoneNumber'] as String,
      whatsAppNumber: json['whatsAppNumber'] as String,
      userName: json['userName'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      email: json['email'] as String,
      userId: json['userId'] as int,
      dateRequest: DateTime.parse(json['dateRequest'] as String),
    );

Map<String, dynamic> _$CarInsuranceModelToJson(CarInsuranceModel instance) =>
    <String, dynamic>{
      'carMake': instance.carMake,
      'carModel': instance.carModel,
      'carYear': instance.carYear.toIso8601String(),
      'carPrice': instance.carPrice,
      'type': instance.type,
      'phoneNumber': instance.phoneNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'userName': instance.userName,
      'birthday': instance.birthday.toIso8601String(),
      'email': instance.email,
      'userId': instance.userId,
      'dateRequest': instance.dateRequest.toIso8601String(),
    };
