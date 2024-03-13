part of 'account_number_cubit.dart';

@freezed
class AccountNumberState with _$AccountNumberState {
  const factory AccountNumberState.initial() = _Initial;
  const factory AccountNumberState.success(UpdateNumberRsponse response) =
      _Success;
  const factory AccountNumberState.failure(String error) = _Failure;
  const factory AccountNumberState.loading() = _Loading;
}
