part of 'insurance_main_ads_cubit.dart';

@freezed
class InsuranceMainAdsState with _$InsuranceMainAdsState {
  const factory InsuranceMainAdsState.initial() = _Initial;
  const factory InsuranceMainAdsState.success(List<AdsModel> ads) = _Success;
  const factory InsuranceMainAdsState.loading() = _Loading;
  const factory InsuranceMainAdsState.faliure(String error) = _Faliure;
}
