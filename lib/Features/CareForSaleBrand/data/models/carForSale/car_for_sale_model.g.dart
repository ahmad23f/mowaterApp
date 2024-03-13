// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_for_sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSaleItem _$CarSaleItemFromJson(Map<String, dynamic> json) => CarSaleItem(
      id: json['id'] as String,
      carMake: json['carMake'] as int?,
      carModel: json['carModel'] as int?,
      year: json['year'] as int?,
      cylinders: json['cylinders'] as int?,
      specifications: json['specifications'] as String?,
      condition: json['condition'] as String?,
      location: json['location'] as String?,
      exteriorColor: json['exteriorColor'] as String?,
      interiorColor: json['interiorColor'] as String?,
      gearBox: json['gearBox'] as String?,
      fuelType: json['fuelType'] as String?,
      warranty: json['warranty'] as int?,
      doors: json['doors'] as int?,
      regionalSpec: json['regionalSpec'] as String?,
      kilometer: json['kilometer'] as String?,
      price: json['price'] as int?,
      whatsappNumber: json['whatsappNumber'] as int?,
      callNumber: json['call_number'] as int?,
      userId: json['user_id'] as int?,
      isAprove: json['isAprove'] as int?,
      isAds: json['isAds'] as int?,
      createdAt: json['createdAt'] as String?,
      imagesId: json['imagesId'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => CarImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarSaleItemToJson(CarSaleItem instance) =>
    <String, dynamic>{
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
      'regionalSpec': instance.regionalSpec,
      'kilometer': instance.kilometer,
      'price': instance.price,
      'whatsappNumber': instance.whatsappNumber,
      'call_number': instance.callNumber,
      'user_id': instance.userId,
      'isAprove': instance.isAprove,
      'isAds': instance.isAds,
      'createdAt': instance.createdAt,
      'imagesId': instance.imagesId,
      'images': instance.images,
    };
