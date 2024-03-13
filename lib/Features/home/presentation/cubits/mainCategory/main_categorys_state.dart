part of 'main_categorys_cubit.dart';

@freezed
class MainCategorysState with _$MainCategorysState {
  const factory MainCategorysState.initial() = _Initial;
  const factory MainCategorysState.success(
      List<MainCategorysModel> mainCategorysModel) = _Success;
  const factory MainCategorysState.loading() = _Loading;
  const factory MainCategorysState.failure(String error) = _Failure;
}
