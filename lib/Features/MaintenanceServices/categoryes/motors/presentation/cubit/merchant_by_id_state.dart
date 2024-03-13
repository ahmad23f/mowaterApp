part of 'merchant_by_id_cubit.dart';

@freezed
class MerchantByIdState with _$MerchantByIdState {
  const factory MerchantByIdState.initial() = _Initial;
  const factory MerchantByIdState.success(
      List<MaintenanceCompanyModel> merchants) = _Success;
  const factory MerchantByIdState.loading() = _Loading;
  const factory MerchantByIdState.failure(String message) = _Failure;
}
