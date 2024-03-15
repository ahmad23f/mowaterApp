import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Mowater/Features/mowaterMart/data/repositeory/mowater_mart.dart';
import 'package:Mowater/core/networking/api/api_service.dart';

part 'mowater_market_state.dart';
part 'mowater_market_cubit.freezed.dart';

class MowaterMarketCubit extends Cubit<MowaterMarketState> {
  List<MowaterMartProductModel> products = [];
  int pageMain = 1; // Page for fetching products
  final ApiService _apiService;

  MowaterMarketCubit(this._apiService)
      : super(const MowaterMarketState.initial());

  Future fetchProducts({
    int? carType,
    String? searchQuery,
    int? productState,
    int? year,
  }) async {
    emit(const MowaterMarketState.loading());

    pageMain = 1; // Reset the page count for fetching products
    final MowaterMartRepositeory martRepository =
        MowaterMartRepositeory(_apiService);

    final response = await martRepository.getProdect(
      page: pageMain,
    );

    response.when(
      success: (data) {
        if (data.isEmpty) {
          emit(const MowaterMarketState.failure('No data available.'));
        } else {
          products.addAll(data);
          emit(MowaterMarketState.success(products));
          pageMain++; // Increment pageMain for the next API call
        }
      },
      failure: (error) {
        if (products.isNotEmpty) {
          emit(MowaterMarketState.success(products));
          return;
        }
        emit(MowaterMarketState.failure(error));
      },
    );
  }

  Future loadMoreProducts({
    int? carType,
    String? searchQuery,
    int? productState,
    int? year,
  }) async {
    try {
      final MowaterMartRepositeory martRepository =
          MowaterMartRepositeory(_apiService);

      final response = await martRepository.getProdect(
        page: pageMain,
      );

      response.when(
        success: (data) {
          if (data.isEmpty) {
            // No more products to load
            emit(MowaterMarketState.success(
              products,
            ));
          } else {
            products += data;
            emit(MowaterMarketState.success(
              products,
            ));
            pageMain++; // Increment pageMain for the next API call
          }
        },
        failure: (error) {
          if (products.isNotEmpty) {
            return;
          }
          emit(MowaterMarketState.failure(error));
        },
      );
    } catch (e) {
      emit(const MowaterMarketState.failure('An error occurred.'));
    }
  }

  Future searchProducts({
    int? carType,
    String? searchQuery,
    int? productState,
    int? year,
  }) async {
    try {
      emit(const MowaterMarketState.loading());
      final MowaterMartRepositeory martRepository =
          MowaterMartRepositeory(_apiService);

      final response = await martRepository.searchProduct(
          search: searchQuery,
          carModel: carType,
          state: productState,
          year: year);

      response.when(
        success: (data) {
          emit(MowaterMarketState.success(data));
        },
        failure: (error) {
          emit(MowaterMarketState.failure(error.toString()));
        },
      );
    } catch (e) {
      emit(MowaterMarketState.failure(e.toString()));
    }
  }
}
