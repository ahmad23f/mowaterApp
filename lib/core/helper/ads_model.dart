import 'package:freezed_annotation/freezed_annotation.dart';
part 'ads_model.g.dart';

@JsonSerializable()
class AdsModel {
  String image;
  int id;
  AdsModel({
    required this.image,
    required this.id,
  });
  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);
  Map<String, dynamic> toJson(AdsModel adsModel) => _$AdsModelToJson(this);
}
