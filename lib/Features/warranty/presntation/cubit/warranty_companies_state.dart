part of 'warranty_companies_cubit.dart';

@freezed
class WarrantyCompaniesState with _$WarrantyCompaniesState {
  const factory WarrantyCompaniesState.initial() = _Initial;
  const factory WarrantyCompaniesState.success(
      List<WarrantyCompanyModel> companies) = _Success;
  const factory WarrantyCompaniesState.faliure() = _Faliure;
  const factory WarrantyCompaniesState.loading() = _Loading;
}
