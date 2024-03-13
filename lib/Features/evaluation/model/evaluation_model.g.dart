// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationModel _$EvaluationModelFromJson(Map<String, dynamic> json) =>
    EvaluationModel(
      id: json['id'] as String,
      year: json['year'] as String,
      specifications: json['specifications'] as String,
      condition: json['condition'] as String,
      warranty: json['warranty'] as String,
      kilometer: json['kilometer'] as String,
      extraInfo: json['extraInfo'] as String,
      phoneNumber: json['phoneNumber'] as String,
      whatsappNumber: json['whatsappNumber'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$EvaluationModelToJson(EvaluationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
      'specifications': instance.specifications,
      'condition': instance.condition,
      'warranty': instance.warranty,
      'kilometer': instance.kilometer,
      'extraInfo': instance.extraInfo,
      'phoneNumber': instance.phoneNumber,
      'whatsappNumber': instance.whatsappNumber,
      'user': instance.user,
    };
