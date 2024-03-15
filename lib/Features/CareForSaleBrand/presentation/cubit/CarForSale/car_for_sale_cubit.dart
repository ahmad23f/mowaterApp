import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/CareForSaleBrand/data/repositeory/cars_for_sale_repositeory.dart';
import 'package:Mowater/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'car_for_sale_cubit.freezed.dart';
part 'car_for_sale_state.dart';

class CarForSaleCubit extends Cubit<CarForSaleState> {
  final ApiService _apiService;
  int page = 1;
  List<CarProduct> cars = [];
  CarForSaleCubit(this._apiService) : super(const CarForSaleState.initial());

  Future fetchProducts({
    int? carType,
    String? searchQuery,
    int? productState,
    int? year,
  }) async {
    emit(const CarForSaleState.loading());

    page = 1; // Reset the page count for fetching products
    final CarsForSaleRepositeory martRepository =
        CarsForSaleRepositeory(_apiService);

    final response = await martRepository.getAllCarsForSale(page);

    response.when(
      success: (data) {
        if (data.isEmpty) {
          emit(const CarForSaleState.faliure('No data available.'));
        } else {
          cars += data;
          emit(CarForSaleState.success(cars));
          page++; // Increment pageMain for the next API call
        }
      },
      failure: (error) {
        if (cars.isNotEmpty) {
          emit(CarForSaleState.success(cars));
          return;
        }
        emit(CarForSaleState.faliure(error));
      },
    );
  }

  Future loadMoreProducts({
    required int page,
  }) async {
    try {
      final CarsForSaleRepositeory martRepository =
          CarsForSaleRepositeory(_apiService);

      final response = await martRepository.getAllCarsForSale(page);

      response.when(
        success: (data) {
          if (data.isEmpty) {
            print('max');
            // No more products to load
            emit(CarForSaleState.success(
              cars,
            ));
          } else {
            cars += data;
            emit(CarForSaleState.success(
              cars,
            ));
            print(cars.length);
            page++; // Increment pageMain for the next API call
          }
        },
        failure: (error) {
          if (cars.isNotEmpty) {
            return;
          }
          emit(CarForSaleState.faliure(error));
        },
      );
    } catch (e) {
      emit(const CarForSaleState.faliure('An error occurred.'));
    }
  }

  Future searchProducts({
    int? carType,
    String? searchQuery,
    String? location,
    String? minPrice,
    String? maxPrice,
  }) async {
    try {
      emit(const CarForSaleState.loading());
      final CarsForSaleRepositeory martRepository =
          CarsForSaleRepositeory(_apiService);

      final response = await martRepository.filteringCars(
          search: searchQuery,
          carMake: carType,
          maxPrice: minPrice,
          minPrice: maxPrice,
          location: location);

      response.when(
        success: (data) {
          emit(CarForSaleState.success(data));
        },
        failure: (error) {
          emit(CarForSaleState.faliure(error.toString()));
        },
      );
    } catch (e) {
      emit(CarForSaleState.faliure(e.toString()));
    }

    getCategoryName(int id) async {
      CarsForSaleRepositeory carsForSaleRepositeory =
          CarsForSaleRepositeory(_apiService);
      emit(const CarForSaleState.loading());
      final response = await carsForSaleRepositeory.getCarCategoryName(id);
      print(response);
      response.when(
        success: (data) {
          emit(CarForSaleState.successCategoryName(data));
        },
        failure: (error) {
          emit(CarForSaleState.faliure(error));
        },
      );
    }
  }
}
