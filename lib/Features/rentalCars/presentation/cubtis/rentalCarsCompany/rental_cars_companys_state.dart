part of 'rental_cars_companys_cubit.dart';

@freezed
class RentalCarsCompanysState with _$RentalCarsCompanysState {
  const factory RentalCarsCompanysState.initial() = _Initial;
  const factory RentalCarsCompanysState.success(
      List<CompanyRentalCarsModel> companys) = _Successs;
  const factory RentalCarsCompanysState.faliure() = _Faliure;
  const factory RentalCarsCompanysState.loading() = _Loading;
}
