import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/warranty/data/company_repo.dart';
import 'package:Mowater/Features/warranty/models/company.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'warranty_companies_state.dart';
part 'warranty_companies_cubit.freezed.dart';

class WarrantyCompaniesCubit extends Cubit<WarrantyCompaniesState> {
  final ApiService _apiService;
  WarrantyCompaniesCubit(this._apiService)
      : super(const WarrantyCompaniesState.initial());

  getCompanies({String? search, String? location, int? discountMowater}) async {
    WarrantyCompanyRepositeory repositeory =
        WarrantyCompanyRepositeory(_apiService);
    final response = await repositeory.getCompany(
        location: location, mowaterDiscount: discountMowater, search: search);
    response.when(
      success: (data) {
        emit(WarrantyCompaniesState.success(data));
      },
      failure: (error) {
        emit(const WarrantyCompaniesState.faliure());
      },
    );
  }

  filter({String? search, String? location, int? discountMowater}) async {
    emit(const WarrantyCompaniesState.loading());
    WarrantyCompanyRepositeory repositeory =
        WarrantyCompanyRepositeory(_apiService);
    final response = await repositeory.getCompany(
        location: location, mowaterDiscount: discountMowater, search: search);
    response.when(
      success: (data) {
        emit(WarrantyCompaniesState.success(data));
      },
      failure: (error) {
        emit(const WarrantyCompaniesState.faliure());
      },
    );
  }
}
