part of 'show_rooms_cubit.dart';

@freezed
class ShowRoomsState with _$ShowRoomsState {
  const factory ShowRoomsState.initial() = _Initial;
  const factory ShowRoomsState.success(List<ShowroomModel> showrooms) = Success;
  const factory ShowRoomsState.loading() = _Loading;
  const factory ShowRoomsState.faliure() = _Faliure;
}
