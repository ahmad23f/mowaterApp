import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/insurance/categorys/Brokers/data/repositeory.dart';
import 'package:Mowater/Features/insurance/categorys/Brokers/models/insurance_providers_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'insurance_provider_service_state.dart';
part 'insurance_provider_service_cubit.freezed.dart';

class InsuranceProviderServiceCubit
    extends Cubit<InsuranceProviderServiceState> {
  final ApiService _apiService;
  InsuranceProviderServiceCubit(this._apiService)
      : super(const InsuranceProviderServiceState.initial());

  getProviders(int type) async {
    emit(const InsuranceProviderServiceState.loading());
    CompanysAndBrokersRepositeory repositeory =
        CompanysAndBrokersRepositeory(_apiService);
    final response = await repositeory.getProviderType(type);
    response.when(
      success: (data) {
        emit(InsuranceProviderServiceState.success(data));
      },
      failure: (error) {
        emit(const InsuranceProviderServiceState.faliure());
      },
    );
  }
}
