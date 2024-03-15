// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:Mowater/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
// import 'package:Mowater/Features/ServiceProvider%20%20Company/data/edit_profile.dart';
// import 'package:Mowater/core/networking/api/api_service.dart';

// part 'edite_normal_company_state.dart';
// part 'edite_normal_company_cubit.freezed.dart';

// class EditeNormalCompanyCubit extends Cubit<EditeNormalCompanyState> {
//   final ApiService _apiService;
//   EditeNormalCompanyCubit(this._apiService)
//       : super(const EditeNormalCompanyState.initial());
//   editMaintenanceProfile(MaintenanceCompanyModel companyModel) async {
//     EditProfileNormalCompany repo = EditProfileNormalCompany(_apiService);
//     final response = await repo.updateMaintenanceCompany(companyModel);
//     response.when(
//       success: (data) {
//         emit(EditeNormalCompanyState.success(data));
//       },
//       failure: (error) {
//         emit(EditeNormalCompanyState.failure(error));
//       },
//     );
//   }
// }
