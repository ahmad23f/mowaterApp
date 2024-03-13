part of 'mobile_service_cubit.dart';

@freezed
class MobileServiceState with _$MobileServiceState {
  const factory MobileServiceState.initial() = _Initial;
  const factory MobileServiceState.success(List<AdsModel> ads) = _Success;
  const factory MobileServiceState.loading() = _Loading;
  const factory MobileServiceState.faliure() = _Faliure;
}
