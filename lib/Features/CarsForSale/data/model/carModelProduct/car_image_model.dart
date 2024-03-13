import 'package:json_annotation/json_annotation.dart';
part 'car_image_model.g.dart';

@JsonSerializable()
class CarImage {
  final String imageName;

  CarImage({
    required this.imageName,
  });

  factory CarImage.fromJson(Map<String, dynamic> json) =>
      _$CarImageFromJson(json);

  Map<String, dynamic> toJson() => _$CarImageToJson(this);
}
