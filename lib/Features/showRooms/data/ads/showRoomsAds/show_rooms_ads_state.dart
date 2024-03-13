part of 'show_rooms_ads_cubit.dart';

@freezed
class ShowRoomsAdsState with _$ShowRoomsAdsState {
  const factory ShowRoomsAdsState.initial() = _Initial;
  const factory ShowRoomsAdsState.success(List<AdsModel> ads) = _Sucesss;
  const factory ShowRoomsAdsState.faliure() = _Faliure;
  const factory ShowRoomsAdsState.loading() = _Loading;
}
