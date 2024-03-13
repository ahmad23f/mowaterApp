// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlateModelForSale _$PlateModelForSaleFromJson(Map<String, dynamic> json) =>
    PlateModelForSale(
      isApproved: json['isApproved'] as int,
      id: json['id'] as int,
      source: json['source'] as String,
      code: json['code'] as String,
      owner: json['owner'] as String,
      whatsApp: json['whatsApp'] as String,
      phoneNmber: json['phoneNmber'] as String,
      price: json['price'] as String,
      postAt: DateTime.parse(json['postAt'] as String),
      isNegotiable: json['isNegotiable'] as int,
      plateNumber: json['plateNumber'] as String,
    );

Map<String, dynamic> _$PlateModelForSaleToJson(PlateModelForSale instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'code': instance.code,
      'owner': instance.owner,
      'whatsApp': instance.whatsApp,
      'phoneNmber': instance.phoneNmber,
      'price': instance.price,
      'postAt': instance.postAt.toIso8601String(),
      'isNegotiable': instance.isNegotiable,
      'plateNumber': instance.plateNumber,
      'isApproved': instance.isApproved,
    };
