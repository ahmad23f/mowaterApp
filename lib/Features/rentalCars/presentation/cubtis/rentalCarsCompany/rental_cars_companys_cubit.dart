import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/rentalCars/data/repositeory/rental_cars.dart';
import 'package:Mowater/Features/rentalCars/models/company_rental_car.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'rental_cars_companys_state.dart';
part 'rental_cars_companys_cubit.freezed.dart';

class RentalCarsCompanysCubit extends Cubit<RentalCarsCompanysState> {
  final ApiService _apiService;
  RentalCarsCompanysCubit(this._apiService)
      : super(const RentalCarsCompanysState.initial());

  getAllCompanys() async {
    RentalCarsRepositeory repositeory = RentalCarsRepositeory(_apiService);
    final response = await repositeory.getAllRentalCarsCompany();
    response.when(
      success: (data) {
        emit(RentalCarsCompanysState.success(data));
      },
      failure: (error) {
        emit(const RentalCarsCompanysState.faliure());
      },
    );
  }
}
