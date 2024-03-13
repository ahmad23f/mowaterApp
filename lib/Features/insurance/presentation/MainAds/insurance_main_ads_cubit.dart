import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/insurance/data/repositeory/ads.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'insurance_main_ads_state.dart';
part 'insurance_main_ads_cubit.freezed.dart';

class InsurancAdsCubit extends Cubit<InsuranceMainAdsState> {
  final ApiService _apiService;
  InsurancAdsCubit(this._apiService)
      : super(const InsuranceMainAdsState.initial());
  getMianAds() async {
    emit(const InsuranceMainAdsState.loading());
    InsuranceMainAdsRepositeory mainAdsRepositeory =
        InsuranceMainAdsRepositeory(_apiService);

    final response = await mainAdsRepositeory.getMainAds();
    response.when(
      success: (data) {
        emit(InsuranceMainAdsState.success(data));
      },
      failure: (error) {
        emit(InsuranceMainAdsState.faliure(error));
      },
    );
  }

  getAdsInCategory(int categoryId) async {
    emit(const InsuranceMainAdsState.loading());

    InsuranceMainAdsRepositeory mainAdsRepositeory =
        InsuranceMainAdsRepositeory(_apiService);

    final response = await mainAdsRepositeory.getAdsInCategory(categoryId);
    response.when(
      success: (data) {
        emit(InsuranceMainAdsState.success(data));
      },
      failure: (error) {
        emit(InsuranceMainAdsState.faliure(error));
      },
    );
  }
}
