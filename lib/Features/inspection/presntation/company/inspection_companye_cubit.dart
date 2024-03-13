import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/inspection/data/repositeory/company.dart';
import 'package:mowaterApp/Features/inspection/models/inspection_company_model.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'inspection_companye_state.dart';
part 'inspection_companye_cubit.freezed.dart';

class InspectionCompanyeCubit extends Cubit<InspectionCompanyeState> {
  final ApiService _apiService;
  InspectionCompanyeCubit(this._apiService)
      : super(const InspectionCompanyeState.initial());
  getCompany(
      {int? specialty,
      String? location,
      int? mowaterDiscount,
      String? name}) async {
    emit(const InspectionCompanyeState.loading());
    InspectionRepositeory repositeory = InspectionRepositeory(_apiService);
    final response = await repositeory.getCompanys(
        specialty, location, mowaterDiscount, name);
    response.when(
      success: (data) {
        emit(InspectionCompanyeState.success(data));
      },
      failure: (error) {
        emit(const InspectionCompanyeState.faliure());
      },
    );
  }
}
