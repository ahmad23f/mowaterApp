import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/models/carBrands/cars_model.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/repositeory/car_brands_repositeory.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'car_brands_state.dart';
part 'car_brands_cubit.freezed.dart';

class CarBrandsCubit extends Cubit<CarBrandsState> {
  final ApiService _apiService;
  CarBrandsCubit(this._apiService) : super(const CarBrandsState.initial());
  getAllBrands() async {
    emit(const CarBrandsState.loading());
    CarBrandsRepositeory carBrandsRepositeory =
        CarBrandsRepositeory(_apiService);
    final response = await carBrandsRepositeory.getALlBrands();
    response.when(
      success: (data) {
        emit(CarBrandsState.success(data));
      },
      failure: (error) {
        emit(CarBrandsState.faliure(error));
      },
    );
  }
}
