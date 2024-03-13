part of 'car_models_brands_cubit.dart';

@freezed
class CarModelsBrandsState with _$CarModelsBrandsState {
  const factory CarModelsBrandsState.initial() = _Initial;
  const factory CarModelsBrandsState.success(List<CarModelsBrand> models) =
      _Success;
  const factory CarModelsBrandsState.faliure() = _Faliure;
  const factory CarModelsBrandsState.loading() = _Loaidng;
}
