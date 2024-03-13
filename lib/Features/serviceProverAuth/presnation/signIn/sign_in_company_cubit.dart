import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/sell_your_plate_screen.dart';
import 'package:mowaterApp/Features/serviceProverAuth/data/repositeory/login_repo.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/networking/models/api_status.dart';

part 'sign_in_company_state.dart';
part 'sign_in_company_cubit.freezed.dart';

class SignInCompanyCubit extends Cubit<SignInCompanyState> {
  final ApiService _apiService;
  SignInCompanyCubit(this._apiService)
      : super(const SignInCompanyState.initial());
  signIn(
      {required String phoneNumber,
      required String password,
      required String tableName}) async {
    SignInServiceProviderRepo signInServiceProviderRepo =
        SignInServiceProviderRepo(_apiService);
    print('============');

    print(tableName);
    print('============');
    switch (tableName) {
      case 'showRooms':
        final response = await signInServiceProviderRepo.signIn(
            columnName: 'callNumber',
            phoneNumber: phoneNumber,
            password: password,
            tableNmae: 'showRooms');

        response.when(
          success: (data) {
            emit(SignInCompanyState.success(data));
          },
          failure: (error) {
            print('meit');
            emit(SignInCompanyState.failure(error));
          },
        );
        break;
      case 'Maintenance':
        final response = await signInServiceProviderRepo.signIn(
            columnName: 'phoneNumber',
            phoneNumber: phoneNumber,
            password: password,
            tableNmae: 'MaintenanceCompanies');

        response.when(
          success: (data) {
            emit(SignInCompanyState.success(data));
          },
          failure: (error) {
            emit(SignInCompanyState.failure(error));
          },
        );
        break;

      case 'insurance':
        // UserServices.saveLoginState(UserModel(userType: 'insurance'));
        break;
      case 'rentalCars':
        // UserServices.saveLoginState(UserModel(userType: 'rentalCars'));
        break;
      case 'warranty':
        // UserServices.saveLoginState(UserModel(userType: 'warranty'));
        break;
      case 'spareParts':
        // UserServices.saveLoginState(UserModel(userType: 'spareParts'));
        break;
      case 'inspection':
        // UserServices.saveLoginState(UserModel(userType: 'inspection'));
        break;
      case 'carCare':
        // UserServices.saveLoginState(UserModel(userType: 'carCare'));
        break;
      case 'mobileService':
        // UserServices.saveLoginState(UserModel(userType: 'mobileService'));
        break;
      default:
        break;
    }
  }
}
