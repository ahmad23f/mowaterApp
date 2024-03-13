part of 'used_spare_parts_ads_cubit.dart';

@freezed
class UsedSparePartsAdsState with _$UsedSparePartsAdsState {
  const factory UsedSparePartsAdsState.initial() = _Initial;
  const factory UsedSparePartsAdsState.success(List<AdsModel> ads) = _Success;
  const factory UsedSparePartsAdsState.loading() = _Loading;
  const factory UsedSparePartsAdsState.faliure() = _Faliure;
}
