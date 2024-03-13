import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/MobileService/data/repositeory/ads_repo.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'mobile_service_state.dart';
part 'mobile_service_cubit.freezed.dart';

class MobileServiceAdsCubit extends Cubit<MobileServiceState> {
  final ApiService _apiService;
  MobileServiceAdsCubit(this._apiService)
      : super(const MobileServiceState.initial());
  getAdsIn(int categoryId) async {
    MobileServiceCategoryAdsRepo repo =
        MobileServiceCategoryAdsRepo(_apiService);
    final response = await repo.getAdsIn(categoryId);
    response.when(
      success: (data) {
        emit(MobileServiceState.success(data));
      },
      failure: (error) {
        emit(const MobileServiceState.faliure());
      },
    );
  }
}
