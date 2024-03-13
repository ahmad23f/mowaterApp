part of 'main_parking_ads_cubit.dart';

@freezed
class MainParkingAdsState with _$MainParkingAdsState {
  const factory MainParkingAdsState.initial() = _Initial;
  const factory MainParkingAdsState.success(List<AdsModel> ads) = _Success;
  const factory MainParkingAdsState.faliure() = _Faliure;
  const factory MainParkingAdsState.loading() = _Loading;
}
