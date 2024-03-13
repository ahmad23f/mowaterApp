part of 'car_for_sale_cubit.dart';

@freezed
class CarForSaleState with _$CarForSaleState {
  const factory CarForSaleState.initial() = _Initial;
  const factory CarForSaleState.success(List<CarProduct> data) = _Success;
  const factory CarForSaleState.successCategoryName(String name) =
      _successCategoryName;
  const factory CarForSaleState.faliure(String error) = _Faliure;
  const factory CarForSaleState.loading() = _Loading;
}
