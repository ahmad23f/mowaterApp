// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_cars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarModel _$RentCarModelFromJson(Map<String, dynamic> json) => RentCarModel(
      images: (json['images'] as List<dynamic>)
          .map((e) => CarImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      carMake: json['carMake'] as String,
      carModel: json['carModel'] as String,
      year: json['year'] as int,
      cylinders: json['cylinders'] as int,
      exteriorColor: json['exteriorColor'] as String,
      interiorColor: json['interiorColor'] as String,
      gearBox: json['gearBox'] as String,
      fuelType: json['fuelType'] as String,
      warranty: json['warranty'] as String,
      doors: json['doors'] as int,
      regionalSpec: json['regionalSpec'] as String,
      whatsappNumber: json['whatsappNumber'] as String,
      callNumber: json['call_number'] as String,
      userId: json['user_id'] as int,
      isAprove: json['isAprove'] as int,
      createdAt: json['createdAt'] as String,
      imagesId: json['imagesId'] as int,
      extraInfo: json['extraInfo'] as String,
      dailyPrice: json['dailyPrice'] as String,
      weeklyPrice: json['weeklyPrice'] as String,
      monthlyPrice: json['monthlyPrice'] as String,
      workingHours: json['workingHours'] as String,
    );

Map<String, dynamic> _$RentCarModelToJson(RentCarModel instance) =>
    <String, dynamic>{
      'carMake': instance.carMake,
      'carModel': instance.carModel,
      'year': instance.year,
      'cylinders': instance.cylinders,
      'exteriorColor': instance.exteriorColor,
      'interiorColor': instance.interiorColor,
      'gearBox': instance.gearBox,
      'fuelType': instance.fuelType,
      'warranty': instance.warranty,
      'doors': instance.doors,
      'regionalSpec': instance.regionalSpec,
      'whatsappNumber': instance.whatsappNumber,
      'call_number': instance.callNumber,
      'user_id': instance.userId,
      'isAprove': instance.isAprove,
      'createdAt': instance.createdAt,
      'imagesId': instance.imagesId,
      'extraInfo': instance.extraInfo,
      'dailyPrice': instance.dailyPrice,
      'weeklyPrice': instance.weeklyPrice,
      'monthlyPrice': instance.monthlyPrice,
      'workingHours': instance.workingHours,
      'images': instance.images,
    };
