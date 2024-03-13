// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowroomModel _$ShowroomModelFromJson(Map<String, dynamic> json) =>
    ShowroomModel(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      showRommImage: json['company_image'] as String,
      specifications: json['specifications'] as String?,
      id: json['id'] as int,
      name: json['name'] as String,
      days: json['days'] as String,
      location: json['location'] as String,
      mowaterDiscount: json['mowaterDiscount'] as int,
      callNumber: json['callNumber'] as int,
      whatsAppNumber: json['whatsAppNumber'] as int,
      descreption: json['descreption'] as String,
      avilableCars: json['avilableCars'] as int,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      cars: (json['cars'] as List<dynamic>)
          .map((e) => CarProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowroomModelToJson(ShowroomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'days': instance.days,
      'location': instance.location,
      'mowaterDiscount': instance.mowaterDiscount,
      'callNumber': instance.callNumber,
      'whatsAppNumber': instance.whatsAppNumber,
      'descreption': instance.descreption,
      'avilableCars': instance.avilableCars,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'company_image': instance.showRommImage,
      'specifications': instance.specifications,
      'cars': instance.cars,
    };
