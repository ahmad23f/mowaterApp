part of 'mowater_mart_cubit.dart';

@freezed
class MowaterMarketState with _$MowaterMarketState {
  const factory MowaterMarketState.initial() = _Initial;
  const factory MowaterMarketState.success(List<MowaterMartProductModel> data) =
      _Success;
  const factory MowaterMarketState.failure(String messages) = _Faliure;
  const factory MowaterMarketState.loading() = _Loading;
}
