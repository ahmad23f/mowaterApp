part of 'maintenance_ads_cubit.dart';

@freezed
class MaintenanceAdsState with _$MaintenanceAdsState {
  const factory MaintenanceAdsState.initial() = _Initial;
  const factory MaintenanceAdsState.success(List<MaintenanceAdsModel> data) =
      _Success;
  const factory MaintenanceAdsState.failure() = _Failuer;
  const factory MaintenanceAdsState.loading() = _Loading;
}
