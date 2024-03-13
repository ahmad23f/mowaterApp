import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/Features/CarsForSale/data/repositeory/related_cars_repsiteory.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'related_car_state.dart';
part 'related_car_cubit.freezed.dart';

class RelatedCarCubit extends Cubit<RelatedCarState> {
  final ApiService _apiService;
  RelatedCarCubit(this._apiService) : super(const RelatedCarState.initial());
  getRealted(String carId, String brandId) async {
    emit(const RelatedCarState.loading());
    RelatedCarsRepositeory carsRepositeory =
        RelatedCarsRepositeory(_apiService);
    final response = await carsRepositeory.getRelatedCars(carId, brandId);
    response.when(
      success: (data) {
        emit(RelatedCarState.succss(data));
      },
      failure: (error) {
        emit(const RelatedCarState.faliure());
      },
    );
  }
}
