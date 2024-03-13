part of 'sign_in_user_cubit.dart';

@freezed
class SignInUserState with _$SignInUserState {
  const factory SignInUserState.initial() = _Initial;
  const factory SignInUserState.success(UserResponse user) = _Success;
  const factory SignInUserState.failure(String errorMessage) = _Failure;
  const factory SignInUserState.loading() = _Loading;
}
