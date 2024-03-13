part of 'show_your_car_cubit.dart';

@freezed
class ShowYourCarState with _$ShowYourCarState {
  const factory ShowYourCarState.initial() = _Initial;
  const factory ShowYourCarState.success(List<Asset> images) = _Success;
  const factory ShowYourCarState.loading() = _Loading;
  const factory ShowYourCarState.faliure() = _Faliure;
}
