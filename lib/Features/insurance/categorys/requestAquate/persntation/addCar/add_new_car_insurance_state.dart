part of 'add_new_car_insurance_cubit.dart';

@freezed
class AddNewCarInsuranceState with _$AddNewCarInsuranceState {
  const factory AddNewCarInsuranceState.initial() = _Initial;
  const factory AddNewCarInsuranceState.success() = _Success;
  const factory AddNewCarInsuranceState.faliure() = _Faliure;
  const factory AddNewCarInsuranceState.loading() = _loading;
}
