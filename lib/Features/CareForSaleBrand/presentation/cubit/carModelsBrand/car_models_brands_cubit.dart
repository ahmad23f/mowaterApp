import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/models/car_model_brands_model.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/repositeory/car_brands_modeels_repositeory.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'car_models_brands_state.dart';
part 'car_models_brands_cubit.freezed.dart';

class CarModelsBrandsCubit extends Cubit<CarModelsBrandsState> {
  final ApiService _apiService;

  CarModelsBrandsCubit(this._apiService)
      : super(const CarModelsBrandsState.initial());

  getBrandModels(String name) async {
    emit(const CarModelsBrandsState.loading());
    CarBrandsModeelsRepositeory carBrandsRepositeory =
        CarBrandsModeelsRepositeory(_apiService);
    final response = await carBrandsRepositeory.getAllModelsInBrand(name);
    response.when(
      success: (data) {
        emit(CarModelsBrandsState.success(data));
      },
      failure: (error) {
        print('======');

        print(error);
        print('======');
        emit(const CarModelsBrandsState.faliure());
      },
    );
  }
}
