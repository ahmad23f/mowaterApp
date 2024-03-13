import 'package:json_annotation/json_annotation.dart';
part 'car_insurance_model.g.dart';

@JsonSerializable()
class CarInsuranceModel {
  int carMake;
  int carModel;
  DateTime carYear;
  String carPrice;
  String type;
  String phoneNumber;
  String whatsAppNumber;
  String userName;
  DateTime birthday;
  String email;
  int userId;
  DateTime dateRequest;
  CarInsuranceModel({
    required this.carMake,
    required this.carModel,
    required this.carYear,
    required this.carPrice,
    required this.type,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.userName,
    required this.birthday,
    required this.email,
    required this.userId,
    required this.dateRequest,
  });
  factory CarInsuranceModel.fromJson(Map<String, dynamic> json) =>
      _$CarInsuranceModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarInsuranceModelToJson(this);
}
