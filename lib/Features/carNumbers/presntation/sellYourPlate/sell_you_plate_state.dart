part of 'sell_you_plate_cubit.dart';

@freezed
class SellYouPlateState with _$SellYouPlateState {
  const factory SellYouPlateState.initial() = _Initial;
  const factory SellYouPlateState.success(String message) = _Success;
  const factory SellYouPlateState.faliure(String message) = _Faliure;
  const factory SellYouPlateState.loading() = _Loading;
}
