part of 'brand_ads_cubit_cubit.dart';

@freezed
class BrandAdsCubitState with _$BrandAdsCubitState {
  const factory BrandAdsCubitState.initial() = _Initial;
  const factory BrandAdsCubitState.success(List<AdsModel> data) = _Success;
  const factory BrandAdsCubitState.faliure(String error) = _Faliure;
  const factory BrandAdsCubitState.loading() = _Loading;
}
