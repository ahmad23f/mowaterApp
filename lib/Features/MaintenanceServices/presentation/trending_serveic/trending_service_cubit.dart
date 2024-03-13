import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/trending_service.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/repositeory/trending_service_repositeory.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'trending_service_state.dart';
part 'trending_service_cubit.freezed.dart';

class TrendingServiceCubit extends Cubit<TrendingServiceState> {
  final ApiService _apiService;
  TrendingServiceCubit(this._apiService)
      : super(const TrendingServiceState.initial());
  getTrending() async {
    emit(const TrendingServiceState.loading());
    TrendingServicesRepositeory trendingServicesRepositeory =
        TrendingServicesRepositeory(_apiService);

    final response = await trendingServicesRepositeory.getTrendingService();
    response.when(
      success: (data) {
        emit(TrendingServiceState.success(data));
      },
      failure: (error) {
        emit(TrendingServiceState.failure(error));
      },
    );
  }
}
