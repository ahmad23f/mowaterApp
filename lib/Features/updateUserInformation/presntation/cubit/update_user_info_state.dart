part of 'update_user_info_cubit.dart';

@freezed
class UpdateUserInfoState with _$UpdateUserInfoState {
  const factory UpdateUserInfoState.initial() = _Initial;
  const factory UpdateUserInfoState.success(
      UpdateUserInformationResponse status) = _Successs;
  const factory UpdateUserInfoState.faliure(String error) = Failure;
  const factory UpdateUserInfoState.loading() = _Loading;
}
