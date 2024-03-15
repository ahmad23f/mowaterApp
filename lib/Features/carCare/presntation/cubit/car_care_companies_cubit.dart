import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/carCare/data/companies.dart';
import 'package:Mowater/Features/carCare/models/car_car_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'car_care_companies_state.dart';
part 'car_care_companies_cubit.freezed.dart';

class CarCareCompaniesCubit extends Cubit<CarCareCompaniesState> {
  final ApiService _apiService;
  CarCareCompaniesCubit(this._apiService)
      : super(const CarCareCompaniesState.initial());
  getCompanies({String? location, required int id, String? search}) async {
    CarCareCompaniesRepositeory repositeory =
        CarCareCompaniesRepositeory(_apiService);
    final response = await repositeory.getCompanies(
        categoryId: id, location: location, searchQuery: search);
    response.when(
      success: (data) {
        emit(CarCareCompaniesState.success(data));
      },
      failure: (error) {
        emit(const CarCareCompaniesState.faliuer());
      },
    );
  }

  search({String? location, required int id, String? search}) async {
    emit(const CarCareCompaniesState.loading());
    CarCareCompaniesRepositeory repositeory =
        CarCareCompaniesRepositeory(_apiService);
    final response = await repositeory.getCompanies(
        categoryId: id, location: location, searchQuery: search);
    response.when(
      success: (data) {
        emit(CarCareCompaniesState.success(data));
      },
      failure: (error) {
        emit(const CarCareCompaniesState.faliuer());
      },
    );
  }
}
