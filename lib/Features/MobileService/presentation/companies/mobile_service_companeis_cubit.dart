import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/MobileService/data/repositeory/companies.dart';
import 'package:Mowater/Features/carCare/models/car_car_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'mobile_service_companeis_cubit.freezed.dart';
part 'mobile_service_companeis_state.dart';

class MobileServiceCompaneisCubit extends Cubit<MobileServiceCompaneisState> {
  final ApiService _apiService;

  MobileServiceCompaneisCubit(this._apiService)
      : super(const MobileServiceCompaneisState.initial());

  getCompanies({String? location, required int id, String? search}) async {
    MobileServiceCompaniesRepositeory repositeory =
        MobileServiceCompaniesRepositeory(_apiService);
    final response = await repositeory.getCompanies(
        categoryId: id, location: location, searchQuery: search);
    response.when(
      success: (data) {
        emit(MobileServiceCompaneisState.success(data));
      },
      failure: (error) {
        emit(const MobileServiceCompaneisState.faliure());
      },
    );
  }

  search({String? location, required int id, String? search}) async {
    emit(const MobileServiceCompaneisState.loading());
    MobileServiceCompaniesRepositeory repositeory =
        MobileServiceCompaniesRepositeory(_apiService);
    final response = await repositeory.getCompanies(
        categoryId: id, location: location, searchQuery: search);
    response.when(
      success: (data) {
        emit(MobileServiceCompaneisState.success(data));
      },
      failure: (error) {
        emit(const MobileServiceCompaneisState.faliure());
      },
    );
  }
}
