import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 0)
class UserHiveModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? type;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? password;

  @HiveField(4)
  DateTime? joinedFrom;

  @HiveField(5)
  String? nickName;

  @HiveField(6)
  String? email;

  @HiveField(7)
  String? phoneNumber;

  @HiveField(8)
  String? whatsAppNumber;

  @HiveField(9)
  String? token;

  @HiveField(10)
  String? image;

  @HiveField(11)
  String? commercialLicenesNumber;

  @HiveField(12)
  String? description;

  @HiveField(13)
  int? mowaterDiscount;

  @HiveField(14)
  String? specialtyCategorys;

  @HiveField(15)
  String? workDays;

  @HiveField(16)
  String? startTime;

  @HiveField(17)
  String? endTime;

  @HiveField(18)
  String? location;

  @HiveField(19)
  String? latitude;

  @HiveField(20)
  String? longitude;

  @HiveField(21)
  String? attachment;

  @HiveField(22)
  int? availableProducts;

  @HiveField(23)
  String? subscriptionState;

  @HiveField(24)
  String? carMakes;

  @HiveField(25)
  String? whatsAppVerificationCode;

  @HiveField(26)
  String? phoneNumberVerificationCode;

  @HiveField(27)
  String? emailVerificationCode;

  @HiveField(28)
  DateTime? lastUpdatePhone;

  @HiveField(29)
  DateTime? lastUpdateWhatsAppNumber;

  @HiveField(30)
  int? emailState;

  UserHiveModel({
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
}
