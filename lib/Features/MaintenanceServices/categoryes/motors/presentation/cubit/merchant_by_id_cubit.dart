import 'package:Mowater/core/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/data/repositeory/get_company_by_id_repositeory.dart';
import 'package:Mowater/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'merchant_by_id_state.dart';
part 'merchant_by_id_cubit.freezed.dart';

class MerchantByIdCubit extends Cubit<MerchantByIdState> {
  final ApiService _apiService;

  MerchantByIdCubit(this._apiService)
      : super(const MerchantByIdState.initial());

  Future getMerchantById(
      {required int id,
      String? locaiton,
      int? carMake,
      String? searchQuery}) async {
    emit(const MerchantByIdState.loading());
    try {
      final merchantByIdRepository = MerchantByIdRepository(_apiService);
      final response = await merchantByIdRepository.getMerchantById(
          id: id, carMake: carMake, location: locaiton, search: searchQuery);

      response.when(
        success: (data) {
          emit(MerchantByIdState.success(data));
        },
        failure: (error) {
          emit(MerchantByIdState.failure(error));
        },
      );
    } catch (e) {
      emit(MerchantByIdState.failure(e.toString()));
    }
  }
}
