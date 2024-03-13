part of 'rental_cars_ads_cubit.dart';

@freezed
class RentalCarsAdsState with _$RentalCarsAdsState {
  const factory RentalCarsAdsState.initial() = _Initial;
  const factory RentalCarsAdsState.success(List<AdsModel> ads) = _Success;
  const factory RentalCarsAdsState.loading() = _Loading;
  const factory RentalCarsAdsState.faliure() = _Faliure;
}
