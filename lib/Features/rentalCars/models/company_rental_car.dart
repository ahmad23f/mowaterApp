import 'package:json_annotation/json_annotation.dart';
import 'package:Mowater/Features/rentalCars/models/rental_cars_model.dart';

part 'company_rental_car.g.dart';

@JsonSerializable()
class CompanyRentalCarsModel {
  final int id;
  final String companyImage;
  final int mowaterDiscount;
  final String name;
  final String whatsApp;
  final String phoneNumber;
  final String location;
  final String daysWeek;
  final String descreption;
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  final int rentalCarsCompanyId;
  final List<RentCarModel> cars; // Add Car field here

  CompanyRentalCarsModel({
    required this.descreption,
    required this.id,
    required this.companyImage,
    required this.mowaterDiscount,
    required this.name,
    required this.whatsApp,
    required this.phoneNumber,
    required this.location,
    required this.daysWeek,
    required this.startTime,
    required this.endTime,
    required this.rentalCarsCompanyId,
    required this.cars, // Add this line
  });

  factory CompanyRentalCarsModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyRentalCarsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyRentalCarsModelToJson(this);
}
