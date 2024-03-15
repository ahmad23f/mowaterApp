// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:Mowater/Features/ServiceProvider%20%20Company/data/maintenance_rep.dart';
// import 'package:Mowater/Features/ServiceProvider%20%20Company/data/show_room_repo.dart';
// import 'package:Mowater/Features/ServiceProvider%20%20Company/model/service_account.dart';
// import 'package:Mowater/Features/signUp/data/models/user_response.dart';
// import 'package:Mowater/core/networking/api/api_service.dart';
// import 'package:Mowater/core/services/company_model.dart';
// import 'package:Mowater/core/services/company_service.dart';
// import 'package:Mowater/core/services/user_state.dart';
// import 'package:Mowater/core/services/user_type.dart';

// part 'provider_service_auth_cubit.freezed.dart';
// part 'provider_service_auth_state.dart';

// class ProviderServiceAuthCubit extends Cubit<ProviderServiceAuthState> {
//   final ApiService _apiService;
//   bool isLoading = false;
//   ProviderServiceAuthCubit(this._apiService)
//       : super(const ProviderServiceAuthState.initial());

//   addProviderService({
//     required ServiceProviderAccountModel providerAccount,
//   }) async {
//     isLoading = true;
//     emit(const ProviderServiceAuthState.loading());
//     ServiceProviderShowRoomRepo showRooms =
//         ServiceProviderShowRoomRepo(_apiService);
//     ServiceProviderMaintenance maintenance =
//         ServiceProviderMaintenance(_apiService);

//     print('=============');

//     print(providerAccount.specialtyName);
//     print('=============');
//     switch (providerAccount.specialtyName) {
//       case 'Maintenance':
//         final response = await maintenance.addServiceProvider(
//             accountModel: providerAccount, tableName: 'MaintenanceCompanies');
//         print('=========Maintenance response=============');

//         response.when(
//           success: (data) {
//             isLoading = false;
//             emit(ProviderServiceAuthState.success(data));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );
//         break;
//       case 'insurance':
//         final response = await maintenance.addServiceProvider(
//             accountModel: providerAccount,
//             tableName: 'InsuranceCompaniesAndBrokers');
//         print('=========InsuranceCompaniesAndBrokers response=============');

//         response.when(
//           success: (data) {
//             isLoading = false;
//             emit(ProviderServiceAuthState.success(data));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );
//         break;

//       case 'Inspection':
//         final response = await maintenance.addServiceProvider(
//             accountModel: providerAccount, tableName: 'inspectionCompanyes');
//         print('inspection');
//         response.when(
//           success: (data) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.success(data));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );
//         break;
//       case 'warranty':
//         final response = await maintenance.addServiceProvider(
//             accountModel: providerAccount, tableName: 'warrantyCompanies');
//         print('warrantyCompanies');
//         response.when(
//           success: (data) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.success(data));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );
//         break;
//       case 'Evaluation':
//         final response = await maintenance.addServiceProvider(
//             accountModel: providerAccount, tableName: 'evaluationCompany');
//         response.when(
//           success: (data) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.success(data));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );
//       case "showRooms":
//         print('==========================');

//         final response =
//             await showRooms.addServiceProvider(accountModel: providerAccount);
//         response.when(
//           success: (data) {
//             NormalCompanyService.saveCompanyData(
//                 NormalCompanyModelHive(name: 'sss'));
//             isLoading = false;

//             emit(ProviderServiceAuthState.success(data['status']));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );
//       case 'inspection':
//         final response = await maintenance.addServiceProvider(
//             accountModel: providerAccount, tableName: 'inspectionCompanyes');
//         print('Evaluation');
//         response.when(
//           success: (data) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.success(data));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );
//       case "spareParts":
//         print('==========================');

//         print('try spare parts');
//         print('==========================');
//         ServiceProviderShowRoomRepo serviceProviderShowRoomRepo =
//             ServiceProviderShowRoomRepo(_apiService);

//         final response = await serviceProviderShowRoomRepo.addServiceProvider(
//             accountModel: providerAccount);
//         response.when(
//           success: (data) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.success(data['status']));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );

//         break;

//       case "mobileService":
//         print('==========================');

//         print('try spare parts');
//         print('==========================');

//         final response = await maintenance.addServiceProvider(
//             tableName: 'MobileServiceCompanies', accountModel: providerAccount);
//         response.when(
//           success: (data) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.success(data['status']));
//           },
//           failure: (error) {
//             isLoading = false;

//             emit(ProviderServiceAuthState.failure(error));
//           },
//         );

//         break;

//       default:
//     }
//   }
// }
