part of 'mobile_service_companeis_cubit.dart';

@freezed
class MobileServiceCompaneisState with _$MobileServiceCompaneisState {
  const factory MobileServiceCompaneisState.initial() = _Initial;
  const factory MobileServiceCompaneisState.success(
      List<MobileServiceModel> companies) = _Success;
  const factory MobileServiceCompaneisState.loading() = _Loading;
  const factory MobileServiceCompaneisState.faliure() = _Faliure;
}
