// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/models/carBrands/cars_model.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/data/models/car_model_brands_model.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/ads/maintenance_ads_model.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/trending_service.dart';
import 'package:mowaterApp/Features/MobileService/model/mobile_service_mode.dart';
import 'package:mowaterApp/Features/Service24/models/recovery_model.dart';
import 'package:mowaterApp/Features/UsedSpareParts/models/spare_part_company.dart';
import 'package:mowaterApp/Features/addNumberForAccount/models/update_number_response_model.dart';
import 'package:mowaterApp/Features/carCare/models/car_car_model.dart';
import 'package:mowaterApp/Features/carNumbers/models/plate_model.dart';
import 'package:mowaterApp/Features/forgetPassword/models/reset_password_response.dart';
import 'package:mowaterApp/Features/fuel/models/fuel_model.dart';
import 'package:mowaterApp/Features/home/models/mainCategorys/main_categorys_model.dart';
import 'package:mowaterApp/Features/home/models/trendingModel/trend_model.dart';
import 'package:mowaterApp/Features/inspection/models/inspection_company_model.dart';
import 'package:mowaterApp/Features/insurance/categorys/Brokers/models/insurance_providers_model.dart';
import 'package:mowaterApp/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:mowaterApp/Features/rentalCars/models/company_rental_car.dart';
import 'package:mowaterApp/Features/showRooms/models/show_room.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/Features/updateUserInformation/models/response_update_user.dart';
import 'package:mowaterApp/Features/warranty/models/company.dart';
import 'package:mowaterApp/core/helper/ads_model.dart';
import 'package:mowaterApp/core/networking/api_constant.dart';
import 'package:mowaterApp/core/networking/models/api_status.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstans.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstans.trending)
  Future<List<TrendingModel>> getAllTrending();

  @GET(ApiConstans.fuelPrice)
  Future<FuelPriceModel> getFuelPrice();

  @GET(ApiConstans.mainCategorys)
  Future<List<MainCategorysModel>> getMainCategorys();

  @GET(ApiConstans.warrantyAds)
  Future<List<MainCategorysModel>> getWarrantyAds();
  @GET(ApiConstans.mobileServiceCategoryAds)
  Future<List<AdsModel>> getMobileServiceCateogyAds(
      @Query('categoryId') int id);

//  mowaterApp mart

  @GET(ApiConstans.mowaterMarket)
  Future<List<MowaterMartProductModel>> getMowaterMarket(
    @Query('page') int? page,
    @Query('state') int? state,
    @Query('car_type') int? carMake,
    @Query('search') String? search,
    @Query('year') int? year,
  );

  @GET(ApiConstans.mowaterMartAds)
  Future<List<AdsModel>> getMowaterMartAds();

  // Search in mowaterApp Mart
  @GET(ApiConstans.mowaterMartSearch)
  Future<List<MowaterMartProductModel>> searchInMowaterMarket(
    @Query('state') int? state,
    @Query('car_type') int? carMake,
    @Query('search') String? search,
    @Query('year') int? year,
  );

//Maintenance Service
  @GET(ApiConstans.maintenanceServicesById)
  Future<List<MaintenanceCompanyModel>> getMaintenanceServiceBySpecialty(
    @Query('id') int id,
    @Query('location') String? location,
    @Query('carMake') int? carMake,
    @Query('search') String? serach,
  );
  @GET(ApiConstans.service24NearestRecovery)
  Future<List<RecoveryModel>> getNearestRecoveryCompanies(
    @Query('lat') String? latitude,
    @Query('long') String? longitude,
    @Query('categoryName') String? categoryName,
  );

  @POST(ApiConstans.searchInMaintenance)
  Future<List<MaintenanceCompanyModel>> searchInMaintenance(
      @Body() Map<String, dynamic> body);

  @GET(ApiConstans.getRelatedProduct)
  Future<List<MowaterMartProductModel>> getRelatedProduct(
      @Query('id') int? id, @Query('type_id') int? type_id);

  @POST(ApiConstans.getTrendtingInMaintence)
  Future<List<MaintenanceAdsModel>> gettMaintenanceServiceAdsById(
      @Body() Map<String, dynamic> data);

  @GET(ApiConstans.trendingService)
  Future<List<TrendingServicesModel>> getTrendingService();

//cars for sale
  @GET(ApiConstans.getAllCarBrands)
  Future<List<CarsBrandsModel>> getAllCarBrands(
      @Query('order_by') String orderBy);

  @POST(ApiConstans.getAllModelBrands)
  Future<List<CarModelsBrand>> getAllModelsBrand(
      @Body() Map<String, dynamic> body);

  @GET(ApiConstans.fuelTypes)
  Future<List<String>> getFuelTypes();

  @POST(ApiConstans.addNewCar)
  Future addCar(FormData data);

  @POST(ApiConstans.addNewCarInsurance)
  Future addCarInsurance(@Body() FormData data);

  @GET(ApiConstans.getAllCarsForSale)
  Future<List<CarProduct>> getAllCarsInALlCategory(
    @Query('page') int? page,
  );
  @GET(ApiConstans.carForSaleFiltering)
  Future<List<CarProduct>> getFilteringCarsForSale(
    @Query('search') String? search,
    @Query('carMakeId') int? carMake,
    @Query('min_price') String? minPrice,
    @Query('max_price') String? maxPrice,
    @Query('location') String? location,
  );

  @GET(ApiConstans.parkingAds)
  Future<List<AdsModel>> getParkingAdsIn(
    @Query("category_id") int page,
  );

  @POST(ApiConstans.getCarCategoryName)
  Future<String> getCareCategoryName(@Body() int id);

  @POST(ApiConstans.getRelatedCars)
  Future<List<CarProduct>> getRelatedCars(
    @Body() Map<String, dynamic> body,
  );
  // show room
  @GET(ApiConstans.allShowRooms)
  Future<List<ShowroomModel>> getAllShowRooms();

  @GET(ApiConstans.inspectionCompanye)
  Future<List<InspectionCompanyModel>> getInspectionCompany(
    @Query('specialty') int? specialty,
    @Query('location') String? location,
    @Query("mowater_discount") int? mowaterDiscount,
    @Query("name") String? name,
  );

//rental cars
  @GET(ApiConstans.getAllCompanyRentalCars)
  Future<List<CompanyRentalCarsModel>> getAllRentalCarsCompany();

//spare parts
  @GET(ApiConstans.sparePartsCompanyByCategory)
  Future<List<SpatepartsCompanyModel>> getSparePartsCompanyInCategory(
    @Query('specifications') int categoryId,
    @Query('state') int? state,
    @Query('location') String? location,
    @Query('car_type') int? carNameId,
    @Query('search') String? searchQuery,
  );
  @GET(ApiConstans.getCarCareCategoryCompanies)
  Future<List<CarCareModel>> getCarCareCompanies(
    @Query('categoryId') int categoryId,
    @Query('location') String? location,
    @Query('search') String? searchQuery,
  );
  @GET(ApiConstans.mobileServiceCompanies)
  Future<List<MobileServiceModel>> getMobileServiceCompanies(
    @Query('categoryId') int categoryId,
    @Query('location') String? location,
    @Query('search') String? searchQuery,
  );
//plates
  @GET(ApiConstans.getPlateCategry)
  Future<List<PlateModelForSale>> getPlateCategory(
    @Query('source') String? source,
    @Query('plateNumber') String? plateNumber,
    @Query('minPrice') String? minPrice,
    @Query('maxPrice') String? maxPrice,
    @Query('plateLength') int? plateLength,
  );

  @POST(ApiConstans.sellYourPlate)
  Future sellYourPlate(
    @Body() Map<String, dynamic> body,
  );
  @GET(ApiConstans.getWarrantyCompanies)
  Future<List<WarrantyCompanyModel>> getWarrantyCompanies(
    @Query('location') String? location,
    @Query('search') String? search,
    @Query('mowaterDiscount') int? mowaterDiscount,
  );

  //ads

  @GET(ApiConstans.getCarCareCategoryAds)
  Future<List<AdsModel>> getCareCareCategoryAds(
      @Query('categoryId') int CategoryId);
  @GET(ApiConstans.brandsAds)
  Future<List<AdsModel>> getBrandsAds();
  @GET(ApiConstans.showRoomsAds)
  Future<List<AdsModel>> getShowRoomsAds();
  @GET(ApiConstans.rentalCarsAds)
  Future<List<AdsModel>> getRentalCarsAds();
  @GET(ApiConstans.ads)
  Future<List<AdsModel>> getAds(@Query('table') String table);

  @GET(ApiConstans.mainParkingAds)
  Future<List<AdsModel>> getMainParkingAds();

  @GET(ApiConstans.inspectionAds)
  Future<List<AdsModel>> getInspectionAds();

  @GET(ApiConstans.insuraceAds)
  Future<List<AdsModel>> getInsuranceMainAds();

  @GET(ApiConstans.sparePartsMainAds)
  Future<List<AdsModel>> getUsedSparePartsMainAds();
  @GET(ApiConstans.plateMainAds)
  Future<List<AdsModel>> getPlateMainAds();

  @GET(ApiConstans.sparePartsCategoryAds)
  Future<List<AdsModel>> getUsedSparePartsCategoryAds(
    @Query("categoryId") int page,
  );

  @GET(ApiConstans.insuranceAdsInCategory)
  Future<List<AdsModel>> getInsuranceAdsByCatogy(
    @Query("categoryId") int page,
  );
  @GET(ApiConstans.insuranceproviders)
  Future<List<InsuranceProvidersModel>> getInsuranceProvidreService(
    @Query("typeId") int type,
  );
  @GET(ApiConstans.getPlateAdsInCateogry)
  Future<List<AdsModel>> getAdsForPlatesCateogyr(
    @Query("category_id") int country,
  );

  //Aut

  @POST(ApiConstans.signUpUser)
  Future<UserResponse> signUpUser(@Body() Map<String, dynamic> userData);

  @POST(ApiConstans.updatePhoneNumberUser)
  Future<UpdateNumberRsponse> updatePhoneNumber(
    @Body() Map<String, dynamic> data,
  );

  @POST(ApiConstans.verifyCode)
  Future<UserResponse> verifyCode(
    @Body() Map<String, dynamic> data,
  );
  @POST(ApiConstans.updateUserInfo)
  Future<UpdateUserInformationResponse> updateUserInfo(
    @Body() FormData data,
  );
  @POST(ApiConstans.signInUser)
  Future<UserResponse> signInUser(
    @Body() FormData data,
  );
  @POST(ApiConstans.resendCode)
  Future<StatusApiResponse> resendOTP(
    @Body() FormData data,
  );
  @POST(ApiConstans.emailVerify)
  Future<StatusApiResponse> verifyEmail(
    @Body() FormData data,
  );
  @POST(ApiConstans.resendEmailCode)
  Future<StatusApiResponse> resednEmailCode(
    @Body() FormData data,
  );
  @POST(ApiConstans.forgetPassword)
  Future<ResetPasswordResponse> forgetPassword(
    @Body() FormData data,
  );
  @POST(ApiConstans.verifyResetPasswordCode)
  Future<ResetPasswordResponse> verifyResetEmailCode(
    @Body() FormData data,
  );

  // service provider

  @POST(ApiConstans.addServiceProviderMaintenance)
  Future addServicePrviderMaintenance(
    @Body() FormData data,
  );
  @POST(ApiConstans.signInServiceProvider)
  Future<StatusApiResponse> signInServiceProvider(
    @Body() FormData data,
  );
  @POST(ApiConstans.addShowRoomCompany)
  Future addServiceProviderShowRoom(
    @Body() FormData data,
  );

  @POST(ApiConstans.addSparePartCompany)
  Future addSparePartCompany(
    @Body() FormData data,
  );

  @GET(ApiConstans.showRoomGetMeCars)
  Future<List<CarProduct>> ShowRoomGetMyCars(@Query('companyId') int id);
  @POST(ApiConstans.showRoomEditAddCar)
  Future showRoomEditAddCar(
    @Body() FormData data,
  );
  @POST(ApiConstans.addProductSpareParts)
  Future addProductSpareParts(
    @Body() FormData data,
  );
  @GET(ApiConstans.getMyProductSpareParts)
  Future getMyProductSpareParts(@Query('publisher_id') int id);

  @POST(ApiConstans.editProfileNormalCompany)
  Future editProfileNormalCompany(@Body() FormData data);
}
