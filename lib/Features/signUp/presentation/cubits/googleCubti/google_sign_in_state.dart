part of 'google_sign_in_cubit.dart';

@freezed
class GoogleSignInState with _$GoogleSignInState {
  const factory GoogleSignInState.initial() = _Initial;
  const factory GoogleSignInState.success(dynamic user) = _Success;
  const factory GoogleSignInState.faliure(String error) = _Faliure;
  const factory GoogleSignInState.loading() = _Loading;
}
