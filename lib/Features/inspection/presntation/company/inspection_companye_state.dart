part of 'inspection_companye_cubit.dart';

@freezed
class InspectionCompanyeState with _$InspectionCompanyeState {
  const factory InspectionCompanyeState.initial() = _Initial;
  const factory InspectionCompanyeState.success(
      List<InspectionCompanyModel> company) = _Sucess;
  const factory InspectionCompanyeState.faliure() = _Faliure;
  const factory InspectionCompanyeState.loading() = _Loading;
}
