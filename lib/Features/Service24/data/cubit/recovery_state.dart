part of 'recovery_cubit.dart';

@freezed
class RecoveryState with _$RecoveryState {
  const factory RecoveryState.initial() = _Initial;
  const factory RecoveryState.success(List<RecoveryModel> compaines) = _Success;
  const factory RecoveryState.faliure() = _Faliure;
  const factory RecoveryState.loading() = _Loading;
}
