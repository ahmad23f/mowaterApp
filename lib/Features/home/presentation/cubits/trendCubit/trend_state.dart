part of 'trend_cubit.dart';

@freezed
class TrendState with _$TrendState {
  const factory TrendState.initial() = _Initial;
  const factory TrendState.success(List<TrendingModel> trendingModel) =
      _Success;
  const factory TrendState.loading() = _Loading;
  const factory TrendState.failure(String error) = _Failure;
}
