// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoveryModel _$RecoveryModelFromJson(Map<String, dynamic> json) =>
    RecoveryModel(
      distance: (json['distance'] as num).toDouble(),
      weeksDayWork: (json['weekday_work'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      location: json['location'] as String,
      phoneNumber: json['phoneNumber'] as String,
      whatsAppNumber: json['WhatsAppNumber'] as String,
      mowaterDiscount: (json['mowaterDiscount'] as num).toDouble(),
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$RecoveryModelToJson(RecoveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'WhatsAppNumber': instance.whatsAppNumber,
      'mowaterDiscount': instance.mowaterDiscount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'image': instance.image,
      'weekday_work': instance.weeksDayWork,
      'distance': instance.distance,
    };
