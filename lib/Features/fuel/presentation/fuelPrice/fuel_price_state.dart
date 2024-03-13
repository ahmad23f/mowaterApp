part of 'fuel_price_cubit.dart';

@freezed
class FuelPriceState with _$FuelPriceState {
  const factory FuelPriceState.initial() = _Initial;
  const factory FuelPriceState.success(FuelPriceModel fuel) = _Success;
  const factory FuelPriceState.faliure() = _Faliure;
  const factory FuelPriceState.loading() = _Loading;
}
