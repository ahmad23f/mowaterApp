part of 'otp_verify_cubit.dart';

@freezed
class OtpVerifyState with _$OtpVerifyState {
  const factory OtpVerifyState.initial() = _Initial;
  const factory OtpVerifyState.success(UserModel user) = _Success;
  const factory OtpVerifyState.faliure(String error) = _Faliure;
  const factory OtpVerifyState.loading() = _Loading;
}
