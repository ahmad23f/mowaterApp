part of 'trending_service_cubit.dart';

@freezed
class TrendingServiceState with _$TrendingServiceState {
  const factory TrendingServiceState.initial() = _Initial;
  const factory TrendingServiceState.success(List<TrendingServicesModel> data) =
      _Success;
  const factory TrendingServiceState.failure(String error) = _Failure;
  const factory TrendingServiceState.loading() = _Loading;
}
