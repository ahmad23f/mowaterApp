part of 'update_profile_cubit.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.initial() = _Initial;
  const factory UpdateProfileState.success(UserModel response) = _Success;
  const factory UpdateProfileState.failure(String mesage) = _Failure;
  const factory UpdateProfileState.Loading() = _Initial;
}
