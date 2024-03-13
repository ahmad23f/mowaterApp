part of 'insurance_provider_service_cubit.dart';

@freezed
class InsuranceProviderServiceState with _$InsuranceProviderServiceState {
  const factory InsuranceProviderServiceState.initial() = _Initial;
  const factory InsuranceProviderServiceState.success(
      List<InsuranceProvidersModel> providers) = _Success;
  const factory InsuranceProviderServiceState.faliure() = _Faliure;
  const factory InsuranceProviderServiceState.loading() = _Loading;
}
