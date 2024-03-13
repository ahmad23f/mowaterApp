// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mowater_mart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MowaterMartProductModel _$MowaterMartProductModelFromJson(
        Map<String, dynamic> json) =>
    MowaterMartProductModel(
      location: json['location'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      isAds: json['isAds'] as int?,
      id: json['id'] as int?,
      typesId: json['types_id'] as int?,
      prodectType: json['prodect_type'] as String?,
      carType: json['car_type'] as String?,
      carStatus: json['car_status'] as int?,
      carModel: json['car_model'] as String?,
      prodectDate: json['prodect_date'] as String?,
      prodectPrice: json['prodect_price'] as String?,
      publisherId: json['publisher_id'] as int?,
      phoneNumber: json['phone_number'] as int?,
      whatsAppNumber: json['whats_app_number'] as int?,
      prodectImag: json['prodect_image'] as String?,
    );

Map<String, dynamic> _$MowaterMartProductModelToJson(
        MowaterMartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'types_id': instance.typesId,
      'prodect_type': instance.prodectType,
      'car_type': instance.carType,
      'car_status': instance.carStatus,
      'car_model': instance.carModel,
      'prodect_date': instance.prodectDate,
      'prodect_price': instance.prodectPrice,
      'publisher_id': instance.publisherId,
      'phone_number': instance.phoneNumber,
      'whats_app_number': instance.whatsAppNumber,
      'prodect_image': instance.prodectImag,
      'isAds': instance.isAds,
      'longitude': instance.longitude,
      'location': instance.location,
      'latitude': instance.latitude,
    };
