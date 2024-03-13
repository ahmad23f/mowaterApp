part of 'car_care_category_ads_cubit.dart';

@freezed
class CarCareCategoryAdsState with _$CarCareCategoryAdsState {
  const factory CarCareCategoryAdsState.initial() = _Initial;
  const factory CarCareCategoryAdsState.success(List<AdsModel> ads) = _Success;
  const factory CarCareCategoryAdsState.faliure() = _Faliure;
  const factory CarCareCategoryAdsState.loading() = _Loading;
}
