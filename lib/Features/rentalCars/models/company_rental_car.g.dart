// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_rental_car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRentalCarsModel _$CompanyRentalCarsModelFromJson(
        Map<String, dynamic> json) =>
    CompanyRentalCarsModel(
      descreption: json['descreption'] as String,
      id: json['id'] as int,
      companyImage: json['companyImage'] as String,
      mowaterDiscount: json['mowaterDiscount'] as int,
      name: json['name'] as String,
      whatsApp: json['whatsApp'] as String,
      phoneNumber: json['phoneNumber'] as String,
      location: json['location'] as String,
      daysWeek: json['daysWeek'] as String,
      startTime: json['startTime'] as String,
      endTime: json['end_time'] as String,
      rentalCarsCompanyId: json['rentalCarsCompanyId'] as int,
      cars: (json['cars'] as List<dynamic>)
          .map((e) => RentCarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyRentalCarsModelToJson(
        CompanyRentalCarsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyImage': instance.companyImage,
      'mowaterDiscount': instance.mowaterDiscount,
      'name': instance.name,
      'whatsApp': instance.whatsApp,
      'phoneNumber': instance.phoneNumber,
      'location': instance.location,
      'daysWeek': instance.daysWeek,
      'descreption': instance.descreption,
      'startTime': instance.startTime,
      'end_time': instance.endTime,
      'rentalCarsCompanyId': instance.rentalCarsCompanyId,
      'cars': instance.cars,
    };
