part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.success(AuthenticatinResponse user) = _Success;
  const factory SignInState.failure(String errorMessage) = _Failure;
  const factory SignInState.loading() = _Loading;
}
