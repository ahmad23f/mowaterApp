// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_categorys_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainCategorysModel _$MainCategorysModelFromJson(Map<String, dynamic> json) =>
    MainCategorysModel(
      id: json['category_id'] as int,
      icon: json['category_icon'] as String,
      name: json['category_name'] as String,
    );

Map<String, dynamic> _$MainCategorysModelToJson(MainCategorysModel instance) =>
    <String, dynamic>{
      'category_icon': instance.icon,
      'category_name': instance.name,
      'category_id': instance.id,
    };
