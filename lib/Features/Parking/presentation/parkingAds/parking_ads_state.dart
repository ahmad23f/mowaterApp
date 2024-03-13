part of 'parking_ads_cubit.dart';

@freezed
class ParkingAdsState with _$ParkingAdsState {
  const factory ParkingAdsState.initial() = _Initial;
  const factory ParkingAdsState.success(List<AdsModel> ads) = _Success;
  const factory ParkingAdsState.faliure(String error) = _Faliure;
  const factory ParkingAdsState.loading() = _Loading;
}
