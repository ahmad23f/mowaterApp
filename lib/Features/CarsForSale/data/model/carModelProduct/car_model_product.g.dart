// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarProduct _$CarProductFromJson(Map<String, dynamic> json) => CarProduct(
      showRoomId: json['showRoomId'] as int?,
      extraInfo: json['extraInfo'] as String?,
      id: json['id'] as String,
      carMake: json['carMake'] as String,
      carModel: json['carModel'] as String,
      year: json['year'] as int,
      cylinders: json['cylinders'] as int,
      condition: json['condition'] as String,
      location: json['location'] as String,
      exteriorColor: json['exteriorColor'] as String?,
      interiorColor: json['interiorColor'] as String,
      gearBox: json['gearBox'] as String,
      fuelType: json['fuelType'] as String,
      warranty: json['warranty'] as int,
      doors: json['doors'] as int,
      kilometer: json['kilometer'] as String,
      price: json['price'] as int,
      whatsappNumber: json['whatsappNumber'] as int,
      callNumber: json['call_number'] as int,
      userId: json['user_id'] as int,
      isAprove: json['isAprove'] as int,
      isAds: json['isAds'] as int,
      createdAt: json['createdAt'] as String,
      imagesId: json['imagesId'] as int?,
      images: (json['images'] as List<dynamic>)
          .map((e) => CarImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: json['specifications'] as String?,
    );

Map<String, dynamic> _$CarProductToJson(CarProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carMake': instance.carMake,
      'carModel': instance.carModel,
      'year': instance.year,
      'cylinders': instance.cylinders,
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
      'whatsappNumber': instance.whatsappNumber,
      'call_number': instance.callNumber,
      'user_id': instance.userId,
      'isAprove': instance.isAprove,
      'isAds': instance.isAds,
      'createdAt': instance.createdAt,
      'imagesId': instance.imagesId,
      'extraInfo': instance.extraInfo,
      'images': instance.images,
      'showRoomId': instance.showRoomId,
      'specifications': instance.specifications,
    };
