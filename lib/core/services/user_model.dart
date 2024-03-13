import 'package:hive/hive.dart';
import 'package:mowaterApp/core/services/user_type.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String? username;

  @HiveField(1)
  String? phoneNumber;

  @HiveField(2)
  String? token;

  @HiveField(3)
  int? id;

  @HiveField(4)
  String? image;
  @HiveField(11)
  int? verify;

  @HiveField(5)
  String? nickName;

  @HiveField(6)
  String? email;
  @HiveField(7)
  String? password;
  @HiveField(8)
  DateTime? lastUpdatePhoneNumber;

  @HiveField(9)
  String? whatsappNumber;

  @HiveField(10)
  DateTime? lastUpdateWhatsAppNumber;

  @HiveField(12)
  int? whatsState;
  @HiveField(13)
  int? emailState;

  @HiveField(14)
  String? emailVerificationCode;
  @HiveField(15)
  String userType;
  User(
      {this.username,
      required this.userType,
      this.whatsState,
      this.emailVerificationCode,
      this.emailState,
      this.email,
      this.lastUpdatePhoneNumber,
      this.lastUpdateWhatsAppNumber,
      this.password,
      this.nickName,
      this.phoneNumber,
      this.token,
      this.whatsappNumber,
      this.image,
      this.verify,
      this.id});
}
