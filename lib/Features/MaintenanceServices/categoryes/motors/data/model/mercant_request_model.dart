import 'package:freezed_annotation/freezed_annotation.dart';

part 'mercant_request_model.g.dart';

@JsonSerializable()
class MerchantRequestModel {
  @JsonKey(name: 'id')
  int id;

  MerchantRequestModel(this.id);
  factory MerchantRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantRequestModelToJson(this);
}
