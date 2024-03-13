import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/CarBrands/car_brands_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/CarForSale/car_for_sale_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/brandAdsCubit/brand_ads_cubit_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/carModelsBrand/car_models_brands_cubit.dart';
import 'package:mowaterApp/Features/CarsForSale/presentation/cubits/cubit/related_car_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/cubit/merchant_by_id_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/maintenanceAds/maintenance_ads_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/mowaterSearch/maintenance_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/trending_serveic/trending_service_cubit.dart';
import 'package:mowaterApp/Features/MobileService/presentation/ads/mobile_service_cubit.dart';
import 'package:mowaterApp/Features/MobileService/presentation/companies/mobile_service_companeis_cubit.dart';
import 'package:mowaterApp/Features/Parking/models/plate_model.dart';
import 'package:mowaterApp/Features/Parking/presentation/parkingAds/parking_ads_cubit.dart';
import 'package:mowaterApp/Features/SellYourCar/data/cubit/cubit/show_your_car_cubit.dart';
import 'package:mowaterApp/Features/Service24/data/cubit/recovery_cubit.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/editNormalCompany/edite_normal_company_cubit.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/providerServicesAuth/provider_service_auth_cubit.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/Cubits/spareParts/spare_parts_category_cubit.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/ads/used_spare_parts_ads_cubit.dart';
import 'package:mowaterApp/Features/addNumberForAccount/presntation/cubit/account_number_cubit.dart';
import 'package:mowaterApp/Features/carCare/presntation/ads/car_care_category_ads_cubit.dart';
import 'package:mowaterApp/Features/carCare/presntation/cubit/car_care_companies_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plateAds/plate_ads_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plateCateogry/plate_category_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/sellYourPlate/sell_you_plate_cubit.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/resetPassword/reset_passwor_cubit.dart';
import 'package:mowaterApp/Features/fuel/presentation/fuelPrice/fuel_price_cubit.dart';
import 'package:mowaterApp/Features/home/presentation/cubits/mainCategory/main_categorys_cubit.dart';
import 'package:mowaterApp/Features/home/presentation/cubits/trendCubit/trend_cubit.dart';
import 'package:mowaterApp/Features/inspection/presntation/ads/inspection_ads_cubit.dart';
import 'package:mowaterApp/Features/inspection/presntation/company/inspection_companye_cubit.dart';
import 'package:mowaterApp/Features/insurance/categorys/Brokers/persntation/cubit/insurance_provider_service_cubit.dart';
import 'package:mowaterApp/Features/insurance/categorys/requestAquate/persntation/addCar/add_new_car_insurance_cubit.dart';
import 'package:mowaterApp/Features/insurance/presentation/MainAds/insurance_main_ads_cubit.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/cubits/mowaterMartAds/cubit/mowater_mart_ads_cubit.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/cubits/mowaterMartCubit/mowater_market_cubit.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/cubits/relatedProduct/related_product_cubit.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/cubtis/cubit/rental_cars_ads_cubit.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/cubtis/rentalCarsCompany/rental_cars_companys_cubit.dart';
import 'package:mowaterApp/Features/serviceProverAuth/presnation/signIn/sign_in_company_cubit.dart';
import 'package:mowaterApp/Features/showRoomMyCars/presntation/addEdit/show_room_add_edit_cubit.dart';
import 'package:mowaterApp/Features/showRoomMyCars/presntation/myCars/show_room_my_cars_cubit.dart';
import 'package:mowaterApp/Features/showRooms/data/ads/showRooms/show_rooms_cubit.dart';
import 'package:mowaterApp/Features/showRooms/data/ads/showRoomsAds/show_rooms_ads_cubit.dart';
import 'package:mowaterApp/Features/signInUser/presntation/cubit/sign_in_user_cubit.dart';
import 'package:mowaterApp/Features/signUp/presentation/cubits/signUp/cubit/sign_up_cubit.dart';
import 'package:mowaterApp/Features/signUp/presentation/cubits/verifyEmail/verify_email_cubit.dart';
import 'package:mowaterApp/Features/sparePartCompany/presntation/myProductSparePart/my_product_spare_part_cubit.dart';
import 'package:mowaterApp/Features/spareParts/presentation/otp/otp_verify_cubit.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/cubit/update_user_info_cubit.dart';
import 'package:mowaterApp/Features/verifyPhoneNumber/presntation/cubit/verify_code_cubit.dart';
import 'package:mowaterApp/Features/warranty/presntation/cubit/warranty_companies_cubit.dart';
import 'package:mowaterApp/core/helper/dio_factory.dart';
import 'package:mowaterApp/core/networking/api/api_service.dart';
import 'package:mowaterApp/core/services/adsCubit/ads_cubit.dart';
import 'package:mowaterApp/core/services/company_model.dart';
import 'package:mowaterApp/core/services/user_model.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServices() async {
  Dio dio = await DioFactory.getDio();
//auth

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerFactory<OtpVerifyCubit>(() => OtpVerifyCubit(getIt()));
  getIt.registerFactory<SignInUserCubit>(() => SignInUserCubit(getIt()));
  getIt.registerFactory<ResendOtpCubit>(() => ResendOtpCubit(getIt()));
  getIt.registerFactory<VerifyEmailCubit>(() => VerifyEmailCubit(getIt()));
  getIt.registerFactory<ResetPassworCubit>(() => ResetPassworCubit(getIt()));
  getIt.registerFactory<ProviderServiceAuthCubit>(
      () => ProviderServiceAuthCubit(getIt()));
  getIt
      .registerFactory<UpdateUserInfoCubit>(() => UpdateUserInfoCubit(getIt()));

  await Hive.openBox<User>('userBox');
  await Hive.openBox<PlateModel>('plate');
  await Hive.openBox<NormalCompanyModelHive>('NormalCompany');
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerFactory<TrendCubit>(() => TrendCubit(getIt()));
  getIt.registerFactory<MainCategorysCubit>(() => MainCategorysCubit(getIt()));
  getIt.registerFactory<WarrantyCompaniesCubit>(
      () => WarrantyCompaniesCubit(getIt()));
  getIt.registerFactory<AdsCubit>(() => AdsCubit(getIt()));
  getIt.registerFactory<CarCareCategoryAdsCubit>(
      () => CarCareCategoryAdsCubit(getIt()));
  getIt.registerFactory<CarCareCompaniesCubit>(
      () => CarCareCompaniesCubit(getIt()));
  getIt.registerFactory<FuelPriceCubit>(() => FuelPriceCubit(getIt()));
  getIt.registerFactory<MobileServiceAdsCubit>(
      () => MobileServiceAdsCubit(getIt()));
  getIt.registerFactory<AccountNumberCubit>(() => AccountNumberCubit(getIt()));

  //api service

//
  //home
  getIt.registerFactory<MobileServiceCompaneisCubit>(
      () => MobileServiceCompaneisCubit(getIt()));

  //cars barnd

  //mowaterApp mart
  getIt.registerFactory<Service24Cubit>(() => Service24Cubit(getIt()));

  getIt.registerFactory<MowaterMarketCubit>(() => MowaterMarketCubit(getIt()));
  getIt
      .registerFactory<MowaterMartAdsCubit>(() => MowaterMartAdsCubit(getIt()));

  getIt
      .registerFactory<RelatedProductCubit>(() => RelatedProductCubit(getIt()));

  //
  getIt
      .registerFactory<MaintenanceAdsCubit>(() => MaintenanceAdsCubit(getIt()));
  getIt.registerFactory<MaintenanceSearchCubit>(
      () => MaintenanceSearchCubit(getIt()));

  //

  getIt.registerFactory<MerchantByIdCubit>(() => MerchantByIdCubit(getIt()));
  //services

  getIt.registerFactory<TrendingServiceCubit>(
      () => TrendingServiceCubit(getIt()));

  //cars for sale
  getIt.registerFactory<CarBrandsCubit>(() => CarBrandsCubit(getIt()));
  getIt.registerFactory<CarForSaleCubit>(() => CarForSaleCubit(getIt()));
  getIt.registerFactory<RelatedCarCubit>(() => RelatedCarCubit(getIt()));
  getIt.registerFactory<BrandAdsCubitCubit>(() => BrandAdsCubitCubit(getIt()));

  //show your car
  getIt.registerFactory<SellYourCarCubti>(() => SellYourCarCubti(getIt()));
  getIt.registerFactory<CarModelsBrandsCubit>(
      () => CarModelsBrandsCubit(getIt()));

  //parking
  getIt.registerFactory<ParkingAdsCubit>(() => ParkingAdsCubit(getIt()));

  //show roooms

  getIt.registerFactory<ShowRoomsAdsCubit>(() => ShowRoomsAdsCubit(getIt()));
  getIt.registerFactory<ShowRoomsCubit>(() => ShowRoomsCubit(getIt()));

  //Insurance
  getIt.registerFactory<InsurancAdsCubit>(() => InsurancAdsCubit(getIt()));
  getIt.registerFactory<AddNewCarInsuranceCubit>(
      () => AddNewCarInsuranceCubit(getIt()));
  getIt.registerFactory<InsuranceProviderServiceCubit>(
      () => InsuranceProviderServiceCubit(getIt()));

  //rental car
  getIt.registerFactory<RentalCarsAdsCubit>(() => RentalCarsAdsCubit(getIt()));
  getIt.registerFactory<RentalCarsCompanysCubit>(
      () => RentalCarsCompanysCubit(getIt()));

  //sparepart
  getIt.registerFactory<UsedSparePartsAdsCubit>(
      () => UsedSparePartsAdsCubit(getIt()));
  getIt.registerFactory<SparePartsCategoryCubit>(
      () => SparePartsCategoryCubit(getIt()));

  //plate
  getIt.registerFactory<PlateAdsCubit>(() => PlateAdsCubit(getIt()));
  getIt.registerFactory<PlateCategoryCubit>(() => PlateCategoryCubit(getIt()));
  getIt.registerFactory<SellYouPlateCubit>(() => SellYouPlateCubit(getIt()));

  //inspection
  getIt.registerFactory<InspectionAdsCubit>(() => InspectionAdsCubit(getIt()));
  getIt.registerFactory<InspectionCompanyeCubit>(
      () => InspectionCompanyeCubit(getIt()));

  //service providers

  getIt
      .registerFactory<ShowRoomMyCarsCubit>(() => ShowRoomMyCarsCubit(getIt()));
  getIt.registerFactory<ShowRoomAddEditCubit>(
      () => ShowRoomAddEditCubit(getIt()));

  getIt.registerFactory<EditeNormalCompanyCubit>(
      () => EditeNormalCompanyCubit(getIt()));
  getIt.registerFactory<SignInCompanyCubit>(() => SignInCompanyCubit(getIt()));
  getIt.registerFactory<MyProductSparePartCubit>(
      () => MyProductSparePartCubit(getIt()));
}
