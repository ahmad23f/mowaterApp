import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/ads/maintenance_ads_model.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/repositeory/ads_in_maintenace_category.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'maintenance_ads_state.dart';
part 'maintenance_ads_cubit.freezed.dart';

class MaintenanceAdsCubit extends Cubit<MaintenanceAdsState> {
  final ApiService _apiService;
  MaintenanceAdsCubit(this._apiService)
      : super(const MaintenanceAdsState.initial());
  getAds(String categoryId) async {
    emit(const MaintenanceAdsState.loading());
    MaintenanceAdsByCategoryRepositeory repositeory =
        MaintenanceAdsByCategoryRepositeory(_apiService);
    final response = await repositeory.GetMaintenanceAds(categoryId);
    response.when(
      success: (data) {
        emit(MaintenanceAdsState.success(data));
      },
      failure: (error) {
        print(error);
        emit(const MaintenanceAdsState.failure());
      },
    );
  }
}
