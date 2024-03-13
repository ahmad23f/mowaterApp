// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesModel _$TypesModelFromJson(Map<String, dynamic> json) => TypesModel(
      c_id: json['c_id'] as int?,
      c_name: json['c_name'] as String?,
      c_icon: json['c_icon'] as String?,
      c_category: json['c_category'] as int?,
    );

Map<String, dynamic> _$TypesModelToJson(TypesModel instance) =>
    <String, dynamic>{
      'c_id': instance.c_id,
      'c_name': instance.c_name,
      'c_icon': instance.c_icon,
      'c_category': instance.c_category,
    };
