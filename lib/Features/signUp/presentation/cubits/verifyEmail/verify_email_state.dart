part of 'verify_email_cubit.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = _Initial;
  const factory VerifyEmailState.success(String successMessage) = _Success;
  const factory VerifyEmailState.failure(String errroMessage) = _Failure;
  const factory VerifyEmailState.loading() = _Loading;
}
