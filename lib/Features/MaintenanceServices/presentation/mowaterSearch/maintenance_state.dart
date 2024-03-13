part of 'maintenance_cubit.dart';

@freezed
class MaintenanceSearchState with _$MaintenanceSearchState {
  const factory MaintenanceSearchState.initial() = _Initial;
  const factory MaintenanceSearchState.success(List<dynamic> products) =
      _Success;
  const factory MaintenanceSearchState.loading() = _Loading;
  const factory MaintenanceSearchState.faliure(String error) = _Faliure;
}
