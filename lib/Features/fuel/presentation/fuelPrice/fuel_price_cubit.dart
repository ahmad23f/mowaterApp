import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/fuel/data/fuel_price_repo.dart';
import 'package:Mowater/Features/fuel/models/fuel_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'fuel_price_state.dart';
part 'fuel_price_cubit.freezed.dart';

class FuelPriceCubit extends Cubit<FuelPriceState> {
  final ApiService _apiService;
  FuelPriceCubit(this._apiService) : super(const FuelPriceState.initial());

  getPrice() async {
    print('well get');
    emit(const FuelPriceState.loading());
    FuelPriceRepositeory repositeory = FuelPriceRepositeory(_apiService);
    final response = await repositeory.getPrices();
    response.when(
      success: (data) {
        emit(FuelPriceState.success(data));
      },
      failure: (error) {
        emit(const FuelPriceState.faliure());
      },
    );
  }

  update() async {
    FuelPriceRepositeory repositeory = FuelPriceRepositeory(_apiService);
    final response = await repositeory.getPrices();
    response.when(
      success: (data) {
        emit(FuelPriceState.success(data));
      },
      failure: (error) {
        emit(const FuelPriceState.faliure());
      },
    );
  }
}
