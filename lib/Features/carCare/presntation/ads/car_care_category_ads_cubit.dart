import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/carCare/data/ads.dart';
import 'package:Mowater/core/helper/ads_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'car_care_category_ads_state.dart';
part 'car_care_category_ads_cubit.freezed.dart';

class CarCareCategoryAdsCubit extends Cubit<CarCareCategoryAdsState> {
  final ApiService _apiService;
  CarCareCategoryAdsCubit(this._apiService)
      : super(const CarCareCategoryAdsState.initial());
  getCategoryAds(int id) async {
    CarCareCategoryAdsRepositeory repositeory =
        CarCareCategoryAdsRepositeory(_apiService);
    final response = await repositeory.getCategorAds(id);
    response.when(
      success: (data) {
        emit(CarCareCategoryAdsState.success(data));
      },
      failure: (error) {
        emit(const CarCareCategoryAdsState.faliure());
      },
    );
  }
}
