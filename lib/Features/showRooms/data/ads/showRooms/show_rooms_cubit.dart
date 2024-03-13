import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/showRooms/data/repositeory/show_rooms.dart';
import 'package:mowaterApp/Features/showRooms/models/show_room.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'show_rooms_state.dart';
part 'show_rooms_cubit.freezed.dart';

class ShowRoomsCubit extends Cubit<ShowRoomsState> {
  final ApiService _apiService;
  ShowRoomsCubit(this._apiService) : super(const ShowRoomsState.initial());
  getAllShowRooms() async {
    ShowRoomsRepositeory showRoomsRepositeory =
        ShowRoomsRepositeory(_apiService);
    final response = await showRoomsRepositeory.getAllShowRooms();
    response.when(
      success: (data) {
        emit(ShowRoomsState.success(data));
      },
      failure: (error) {
        print(error);
        emit(const ShowRoomsState.faliure());
      },
    );
  }
}
