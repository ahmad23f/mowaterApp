import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_number_response_model.g.dart';

@JsonSerializable()
class UpdateNumberRsponse {
  String status;
  String message;
  int whatsappVerified;
  int phoneVerified;
  UpdateNumberRsponse(
      {required this.status,
      required this.message,
      required this.whatsappVerified,
      required this.phoneVerified});

  Map<String, dynamic> toJSon() => _$UpdateNumberRsponseToJson(this);
  factory UpdateNumberRsponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNumberRsponseFromJson(json);
}
