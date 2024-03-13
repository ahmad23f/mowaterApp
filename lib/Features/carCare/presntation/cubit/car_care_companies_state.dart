part of 'car_care_companies_cubit.dart';

@freezed
class CarCareCompaniesState with _$CarCareCompaniesState {
  const factory CarCareCompaniesState.initial() = _Initial;
  const factory CarCareCompaniesState.success(List<CarCareModel> compaines) =
      _Success;
  const factory CarCareCompaniesState.faliuer() = _Faliuer;
  const factory CarCareCompaniesState.loading() = _Loading;
}
