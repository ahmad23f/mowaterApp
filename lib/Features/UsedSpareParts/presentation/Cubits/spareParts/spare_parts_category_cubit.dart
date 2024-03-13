import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mowaterApp/Features/UsedSpareParts/data/repositeory/category_repositeory.dart';
import 'package:mowaterApp/Features/UsedSpareParts/models/spare_part_company.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';

part 'spare_parts_category_state.dart';
part 'spare_parts_category_cubit.freezed.dart';

class SparePartsCategoryCubit extends Cubit<SparePartsCategoryState> {
  final ApiService _apiService;

  SparePartsCategoryCubit(this._apiService)
      : super(const SparePartsCategoryState.initial());

  getCompanyAt(
      {required int id,
      int? state,
      String? country,
      int? carModelId,
      String? searchQuery}) async {
    emit(const SparePartsCategoryState.loading());
    SparePartsCategoryRepositeory repository =
        SparePartsCategoryRepositeory(_apiService);
    final response = await repository.getCompanyAt(
        id, state, country, carModelId, searchQuery);
    response.when(
      success: (data) {
        emit(SparePartsCategoryState.succss(data));
      },
      failure: (error) {
        emit(const SparePartsCategoryState.faliure());
      },
    );
  }
}
