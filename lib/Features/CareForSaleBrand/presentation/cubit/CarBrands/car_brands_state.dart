part of 'car_brands_cubit.dart';

@freezed
class CarBrandsState with _$CarBrandsState {
  const factory CarBrandsState.initial() = _Initial;
  const factory CarBrandsState.success(List<CarsBrandsModel> data) = _Success;
  const factory CarBrandsState.faliure(String error) = _Faliure;
  const factory CarBrandsState.loading() = _Loading;
}
