import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/car_model.dart';
import 'package:mowaterApp/Features/showRoomMyCars/data/add_edit_car.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'show_room_add_edit_state.dart';
part 'show_room_add_edit_cubit.freezed.dart';

class ShowRoomAddEditCubit extends Cubit<ShowRoomAddEditState> {
  final ApiService _apiService;
  ShowRoomAddEditCubit(this._apiService)
      : super(const ShowRoomAddEditState.initial());

  addCar({required Car car, required List<File> images}) async {
    ShowRoomAddEditCarRepositeory repositeory =
        ShowRoomAddEditCarRepositeory(_apiService);
    final response =
        await repositeory.addEditCar(car: car, images: images, isEdit: 0);
  }

  editCar({required Car car, required List<File> images}) async {
    ShowRoomAddEditCarRepositeory repositeory =
        ShowRoomAddEditCarRepositeory(_apiService);
    final response =
        await repositeory.addEditCar(car: car, images: images, isEdit: 1);
  }
}
