// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingModel _$TrendingModelFromJson(Map<String, dynamic> json) =>
    TrendingModel(
      id: json['id'] as int,
      title: json['title'] as String,
      descreption: json['descreption'] as String,
      image: json['image'] as String,
      create_at: DateTime.parse(json['create_at'] as String),
      product_id: json['product_id'] as int,
    );

Map<String, dynamic> _$TrendingModelToJson(TrendingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'descreption': instance.descreption,
      'image': instance.image,
      'create_at': instance.create_at.toIso8601String(),
      'product_id': instance.product_id,
    };
