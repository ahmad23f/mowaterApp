part of 'mowater_mart_ads_cubit.dart';

@freezed
class MowaterMartAdsState with _$MowaterMartAdsState {
  const factory MowaterMartAdsState.initial() = _Initial;
  const factory MowaterMartAdsState.success(List<AdsModel> ads) = _Success;
  const factory MowaterMartAdsState.loading() = _Loading;
  const factory MowaterMartAdsState.faliure() = _Faliure;
}
