part of 'show_room_add_edit_cubit.dart';

@freezed
class ShowRoomAddEditState with _$ShowRoomAddEditState {
  const factory ShowRoomAddEditState.initial() = _Initial;
  const factory ShowRoomAddEditState.success(String message) = _Success;
  const factory ShowRoomAddEditState.failure(String message) = _Failure;
  const factory ShowRoomAddEditState.loading() = _Loading;
}
