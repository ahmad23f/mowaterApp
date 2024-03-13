part of 'inspection_ads_cubit.dart';

@freezed
class InspectionAdsState with _$InspectionAdsState {
  const factory InspectionAdsState.initial() = _Initial;
  const factory InspectionAdsState.success(List<AdsModel> ads) = _Success;
  const factory InspectionAdsState.faliure() = _Faliure;
  const factory InspectionAdsState.loading() = _Loading;
}
