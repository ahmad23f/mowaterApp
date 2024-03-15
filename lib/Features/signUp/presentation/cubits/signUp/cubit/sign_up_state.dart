part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.success(AuthenticatinResponse user) = _Success;
  const factory SignUpState.faliure(String faliure) = _Faliure;
}
