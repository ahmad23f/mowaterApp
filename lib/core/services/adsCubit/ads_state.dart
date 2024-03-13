part of 'ads_cubit.dart';

@freezed
class AdsState with _$AdsState {
  const factory AdsState.initial() = _Initial;
  const factory AdsState.success(List<AdsModel> ads) = _Success;
  const factory AdsState.faliure() = _Faliure;
  const factory AdsState.loading() = _Loading;
}
