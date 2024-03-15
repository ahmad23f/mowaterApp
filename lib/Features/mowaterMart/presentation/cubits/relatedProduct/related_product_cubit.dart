import 'package:Mowater/Features/mowaterMart/data/repositeory/related_product_repositeory.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/Features/mowaterMart/data/repositeory/related_product_repositeory.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'related_product_state.dart';
part 'related_product_cubit.freezed.dart';

class RelatedProductCubit extends Cubit<RelatedProductState> {
  final ApiService _apiService;
  RelatedProductCubit(this._apiService)
      : super(const RelatedProductState.initial());
  getRelated(int id, int typeId) async {
    emit(const RelatedProductState.loading());
    RelatedProductRepositeory repositeory =
        RelatedProductRepositeory(_apiService);
    final response = await repositeory.getRelated(id, typeId);

    response.when(
      success: (data) {
        emit(RelatedProductState.success(data));
      },
      failure: (error) {
        emit(const RelatedProductState.failure());
      },
    );
  }
}
