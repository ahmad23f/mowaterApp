import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/rentalCars/data/repositeory/rental_cars.dart';
import 'package:Mowater/core/helper/ads_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'rental_cars_ads_state.dart';
part 'rental_cars_ads_cubit.freezed.dart';

class RentalCarsAdsCubit extends Cubit<RentalCarsAdsState> {
  final ApiService _apiService;
  RentalCarsAdsCubit(this._apiService)
      : super(const RentalCarsAdsState.initial());

  getAds() async {
    RentalCarsRepositeory repositeory = RentalCarsRepositeory(_apiService);
    final response = await repositeory.getAds();
    response.when(
      success: (ads) {
        emit(RentalCarsAdsState.success(ads));
      },
      failure: (error) {
        emit(const RentalCarsAdsState.faliure());
      },
    );
  }
}
