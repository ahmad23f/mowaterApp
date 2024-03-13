part of 'plate_ads_cubit.dart';

@freezed
class PlateAdsState with _$PlateAdsState {
  const factory PlateAdsState.initial() = _Initial;
  const factory PlateAdsState.success(List<AdsModel> ads) = _Success;
  const factory PlateAdsState.faliure() = _Faliure;
  const factory PlateAdsState.loading() = _Loading;
}
