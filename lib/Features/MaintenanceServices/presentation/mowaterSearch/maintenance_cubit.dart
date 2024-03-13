import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/repositeory/search_repositeory.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'maintenance_state.dart';
part 'maintenance_cubit.freezed.dart';

class MaintenanceSearchCubit extends Cubit<MaintenanceSearchState> {
  final ApiService _apiService;
  MaintenanceSearchCubit(this._apiService)
      : super(const MaintenanceSearchState.initial());
  mowaterSearch(String name, int id) async {
    emit(const MaintenanceSearchState.loading());
    SearchInMaintenaceRepositeory searchMowaterMartRepositeory =
        SearchInMaintenaceRepositeory(_apiService);

    final response = await searchMowaterMartRepositeory.search(name, id);

    response.when(
      success: (products) {
        emit(MaintenanceSearchState.success(products));
      },
      failure: (error) {
        emit(MaintenanceSearchState.faliure(error));
      },
    );
  }
}
