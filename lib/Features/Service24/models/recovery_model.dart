import 'package:json_annotation/json_annotation.dart';
part 'recovery_model.g.dart';

@JsonSerializable()
class RecoveryModel {
  final int id;
  final String name;
  final String location;
  final String phoneNumber;
  @JsonKey(name: 'WhatsAppNumber')
  final String whatsAppNumber;
  final double mowaterDiscount;
  final String latitude;
  final String longitude;
  final String image;
  @JsonKey(name: 'weekday_work')
  List<String> weeksDayWork;
  double distance;
  RecoveryModel({
    required this.distance,
    required this.weeksDayWork,
    required this.image,
    required this.id,
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.mowaterDiscount,
    required this.latitude,
    required this.longitude,
  });

  factory RecoveryModel.fromJson(Map<String, dynamic> json) =>
      _$RecoveryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecoveryModelToJson(this);
}
