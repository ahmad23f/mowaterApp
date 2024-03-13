import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/Features/showRoomMyCars/data/show_room_my_cars_repo.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'show_room_my_cars_state.dart';
part 'show_room_my_cars_cubit.freezed.dart';

class ShowRoomMyCarsCubit extends Cubit<ShowRoomMyCarsState> {
  final ApiService _apiService;
  ShowRoomMyCarsCubit(this._apiService)
      : super(const ShowRoomMyCarsState.initial());

  getMyCars(int id) async {
    emit(const ShowRoomMyCarsState.loading());
    ShowRoomMyCarsRepositeory myCarsRepositeory =
        ShowRoomMyCarsRepositeory(_apiService);
    final response = await myCarsRepositeory.getMycars(id);
    response.when(
      success: (data) {
        emit(ShowRoomMyCarsState.success(data));
      },
      failure: (error) {
        emit(ShowRoomMyCarsState.failure(error));
      },
    );
  }
}
