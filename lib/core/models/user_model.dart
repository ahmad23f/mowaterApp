import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? type;
  String? name;
  String? password;
  DateTime? joinedFrom;
  String? nickName;
  String? email;
  String? phoneNumber;
  String? whatsAppNumber;
  String? token;
  String? image;
  String? commercialLicenesNumber;
  String? description;
  int? mowaterDiscount;
  String? specialtyCategorys;
  String? workDays;
  String? startTime;
  String? endTime;
  String? location;
  String? latitude;
  String? longitude;
  String? attachment;
  int? availableProducts;
  String? subscriptionState;
  String? carMakes;
  String? whatsAppVerificationCode;
  String? phoneNumberVerificationCode;
  String? emailVerificationCode;
  DateTime? lastUpdatePhone;
  DateTime? lastUpdateWhatsAppNumber;

  int? emailState;

  UserModel({
    this.id,
    this.type,
    this.name,
    this.password,
    this.joinedFrom,
    this.nickName,
    this.email,
    this.phoneNumber,
    this.whatsAppNumber,
    this.token,
    this.image,
    this.commercialLicenesNumber,
    this.description,
    this.mowaterDiscount,
    this.specialtyCategorys,
    this.workDays,
    this.startTime,
    this.endTime,
    this.location,
    this.latitude,
    this.longitude,
    this.attachment,
    this.availableProducts,
    this.subscriptionState,
    this.carMakes,
    this.whatsAppVerificationCode,
    this.phoneNumberVerificationCode,
    this.emailVerificationCode,
    this.lastUpdatePhone,
    this.lastUpdateWhatsAppNumber,
    this.emailState,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
