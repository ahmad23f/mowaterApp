part of 'sign_in_company_cubit.dart';

@freezed
class SignInCompanyState with _$SignInCompanyState {
  const factory SignInCompanyState.initial() = _Initial;
  const factory SignInCompanyState.success(StatusApiResponse messsage) =
      _Success;
  const factory SignInCompanyState.failure(String errorMessage) = _Failure;
  const factory SignInCompanyState.loading() = _Loading;
}
