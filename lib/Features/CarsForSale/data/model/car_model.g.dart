// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as int,
      carMake: json['carMake'] as String,
      carModel: json['carModel'] as String,
      year: json['year'] as int,
      cylinders: json['cylinders'] as int,
      specifications: json['specifications'] as String,
      condition: json['condition'] as String,
      location: json['location'] as String,
      exteriorColor: json['exteriorColor'] as String,
      interiorColor: json['interiorColor'] as String,
      gearBox: json['gearBox'] as String,
      fuelType: json['fuelType'] as String,
      warranty: json['warranty'] as int,
      doors: json['doors'] as int,
      kilometer: json['kilometer'] as String,
      price: json['price'] as int,
      imagesId: json['imagesId'] as int,
      whatsappNumber: json['wahts_number'] as int,
      phoneNumber: json['call_number'] as int,
      userId: json['user_id'] as int,
      isAprove: json['isAprove'] as int,
      isAds: json['isAds'] as int,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'carMake': instance.carMake,
      'carModel': instance.carModel,
      'year': instance.year,
      'cylinders': instance.cylinders,
      'specifications': instance.specifications,
      'condition': instance.condition,
      'location': instance.location,
      'exteriorColor': instance.exteriorColor,
      'interiorColor': instance.interiorColor,
      'gearBox': instance.gearBox,
      'fuelType': instance.fuelType,
      'warranty': instance.warranty,
      'doors': instance.doors,
      'kilometer': instance.kilometer,
      'price': instance.price,
      'imagesId': instance.imagesId,
      'wahts_number': instance.whatsappNumber,
      'call_number': instance.phoneNumber,
      'user_id': instance.userId,
      'isAprove': instance.isAprove,
      'isAds': instance.isAds,
      'createdAt': instance.createdAt.toIso8601String(),
    };
