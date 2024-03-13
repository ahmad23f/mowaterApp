import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/car_brands_screen.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cars_details_screen.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cars_screen.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/CarBrands/car_brands_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/CarForSale/car_for_sale_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/brandAdsCubit/brand_ads_cubit_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/carModelsBrand/car_models_brands_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/cars_brands_body.dart';
import 'package:mowaterApp/Features/CarsForSale/data/model/carModelProduct/car_model_product.dart';
import 'package:mowaterApp/Features/CarsForSale/presentation/cubits/cubit/related_car_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/cubit/merchant_by_id_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/motors_screen.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/maintenanceAds/maintenance_ads_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/maintenance_details_screen.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/maintenance_services_screen.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/mowaterSearch/maintenance_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/trending_serveic/trending_service_cubit.dart';
import 'package:mowaterApp/Features/MobileService/presentation/ads/mobile_service_cubit.dart';
import 'package:mowaterApp/Features/MobileService/presentation/companies/mobile_service_companeis_cubit.dart';
import 'package:mowaterApp/Features/MobileService/presentation/mobile_service_category.dart';
import 'package:mowaterApp/Features/MobileService/presentation/mobile_service_screen.dart';
import 'package:mowaterApp/Features/Parking/data/model/parking_model.dart';
import 'package:mowaterApp/Features/Parking/presentation/add_plate_screen.dart';
import 'package:mowaterApp/Features/Parking/presentation/parkingAds/parking_ads_cubit.dart';
import 'package:mowaterApp/Features/Parking/presentation/plate_screen.dart';
import 'package:mowaterApp/Features/Parking/presentation/widgets/parking_form_screen.dart';
import 'package:mowaterApp/Features/Parking/presentation/parking_screen.dart';
import 'package:mowaterApp/Features/SellYourCar/presentation/show_your_car_screen.dart';
import 'package:mowaterApp/Features/Service24/data/cubit/recovery_cubit.dart';
import 'package:mowaterApp/Features/Service24/presentation/recovery_screen.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/editNormalCompany/edite_normal_company_cubit.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/form_company_detials_screen.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/providerServicesAuth/provider_service_auth_cubit.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/presntation/success_register_provider_screen.dart';
import 'package:mowaterApp/Features/UsedSpareParts/models/spare_part_company.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/Cubits/spareParts/spare_parts_category_cubit.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/ads/used_spare_parts_ads_cubit.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/apare_parts_company_detials_screen.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/spare_part_category_screen.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/spare_part_screen.dart';
import 'package:mowaterApp/Features/addNumberForAccount/presntation/add_account_number.dart';
import 'package:mowaterApp/Features/addNumberForAccount/presntation/cubit/account_number_cubit.dart';
import 'package:mowaterApp/Features/carCare/presntation/ads/car_care_category_ads_cubit.dart';
import 'package:mowaterApp/Features/carCare/presntation/car_care_category_screen.dart';
import 'package:mowaterApp/Features/carCare/presntation/car_care_screen.dart';
import 'package:mowaterApp/Features/carCare/presntation/cubit/car_care_companies_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/car_number_screen.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plateAds/plate_ads_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plateCateogry/plate_category_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plates_screen.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/sellYourPlate/sell_you_plate_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/sell_your_plate_screen.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/widgets/plate_widget.dart';
import 'package:mowaterApp/Features/choseAccountType/presentation/chose_account_type_screen.dart';
import 'package:mowaterApp/Features/drawer/widgets/normalCompany/edite_profiel.dart';
import 'package:mowaterApp/Features/evaluation/presentation/evaluation_screen.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/forget_password_screen.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/password_changed_success.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/resetPassword/reset_passwor_cubit.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/reset_password_screen.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/verif_reset_password_screen.dart';
import 'package:mowaterApp/Features/home/presentation/cubits/mainCategory/main_categorys_cubit.dart';
import 'package:mowaterApp/Features/home/presentation/cubits/trendCubit/trend_cubit.dart';
import 'package:mowaterApp/Features/home/presentation/home_screen.dart';
import 'package:mowaterApp/Features/inspection/models/inspection_company_model.dart';
import 'package:mowaterApp/Features/inspection/presntation/ads/inspection_ads_cubit.dart';
import 'package:mowaterApp/Features/inspection/presntation/company/inspection_companye_cubit.dart';
import 'package:mowaterApp/Features/inspection/presntation/company_details_screen.dart';
import 'package:mowaterApp/Features/inspection/presntation/inspection_screen.dart';
import 'package:mowaterApp/Features/insurance/categorys/Brokers/persntation/broker_screen.dart';
import 'package:mowaterApp/Features/insurance/categorys/Brokers/persntation/cubit/insurance_provider_service_cubit.dart';
import 'package:mowaterApp/Features/insurance/categorys/companies/presntation/companies_screen.dart';
import 'package:mowaterApp/Features/insurance/categorys/requestAquate/persntation/addCar/add_new_car_insurance_cubit.dart';
import 'package:mowaterApp/Features/insurance/categorys/requestAquate/persntation/request_a_quate.dart';
import 'package:mowaterApp/Features/insurance/presentation/MainAds/insurance_main_ads_cubit.dart';
import 'package:mowaterApp/Features/insurance/presentation/insurance_screen.dart';
import 'package:mowaterApp/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/cubits/mowaterMartAds/cubit/mowater_mart_ads_cubit.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/cubits/mowaterMartCubit/mowater_market_cubit.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/mowater_mart_product_details._screen.dart';
import 'package:mowaterApp/Features/mowaterMart/presentation/mowater_mart_screen.dart';
import 'package:mowaterApp/Features/onBoarding/presentation/on_boarding_screen.dart';
import 'package:mowaterApp/Features/rentalCars/models/company_rental_car.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/car_details.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/cubtis/cubit/rental_cars_ads_cubit.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/cubtis/rentalCarsCompany/rental_cars_companys_cubit.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/rental_car_company_detials.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/rental_cars_screen.dart';
import 'package:mowaterApp/Features/serviceProverAuth/presnation/signIn/sign_in_company_cubit.dart';
import 'package:mowaterApp/Features/serviceProverAuth/presnation/sign_in_screen.dart';
import 'package:mowaterApp/Features/showRoomMyCars/add_new_car_screen.dart';
import 'package:mowaterApp/Features/showRoomMyCars/presntation/addEdit/show_room_add_edit_cubit.dart';
import 'package:mowaterApp/Features/showRoomMyCars/presntation/myCars/show_room_my_cars_cubit.dart';
import 'package:mowaterApp/Features/showRoomMyCars/presntation/show_room_my_cars.dart';
import 'package:mowaterApp/Features/showRooms/data/ads/showRooms/show_rooms_cubit.dart';
import 'package:mowaterApp/Features/showRooms/data/ads/showRoomsAds/show_rooms_ads_cubit.dart';
import 'package:mowaterApp/Features/showRooms/models/show_room.dart';
import 'package:mowaterApp/Features/showRooms/presentation/show_rooms_details_screen.dart';
import 'package:mowaterApp/Features/showRooms/presentation/show_rooms_screen.dart';
import 'package:mowaterApp/Features/signInUser/presntation/cubit/sign_in_user_cubit.dart';
import 'package:mowaterApp/Features/signInUser/presntation/sign_in_user_screen.dart';
import 'package:mowaterApp/Features/signUp/presentation/cubits/googleCubti/google_sign_in_cubit.dart';
import 'package:mowaterApp/Features/signUp/presentation/cubits/signUp/cubit/sign_up_cubit.dart';
import 'package:mowaterApp/Features/signUp/presentation/cubits/verifyEmail/verify_email_cubit.dart';
import 'package:mowaterApp/Features/signUp/presentation/email_verify_code_screen.dart';
import 'package:mowaterApp/Features/signUp/presentation/sign_up_screen.dart';
import 'package:mowaterApp/Features/spareParts/presentation/otp/otp_verify_cubit.dart';
import 'package:mowaterApp/Features/splash.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/cubit/update_user_info_cubit.dart';
import 'package:mowaterApp/Features/updateUserInformation/presntation/user_information_screen.dart';
import 'package:mowaterApp/Features/verifyPhoneNumber/presntation/cubit/verify_code_cubit.dart';
import 'package:mowaterApp/Features/verifyPhoneNumber/presntation/verify_code_screen.dart';
import 'package:mowaterApp/Features/warranty/presntation/cubit/warranty_companies_cubit.dart';
import 'package:mowaterApp/Features/warranty/presntation/warranty_screen.dart';
import 'package:mowaterApp/core/di/dependency_injection.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/routing/transition_animation.dart';
import 'package:mowaterApp/core/services/adsCubit/ads_cubit.dart';
import 'package:mowaterApp/core/services/company_service.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/services/user_type.dart';

bool isCheckd = false;

class RoutingApp {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteName.choseAccountTypeScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomSlideTransition(child: const ChoseAccountTypeScreen());
        },
      ),
      GoRoute(
        path: RouteName.splashScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomSlideTransition(child: const SplashScreen());
        },
      ),
      GoRoute(
        path: RouteName.serviceProviderChoseTypeAccountScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomSlideTransition(
            child: BlocProvider(
              create: (context) => getIt<ProviderServiceAuthCubit>(),
              child: const ServiceProviderChoseTypeAccountScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: RouteName.thankYouForRegister,
        builder: (BuildContext context, GoRouterState state) {
          String usertype = state.extra as String;
          return ThankYouScreen(
            userType: usertype,
          );
        },
      ),
      GoRoute(
        path: RouteName.loginServiceProvider,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomSlideTransition(
              child: BlocProvider(
            create: (context) => getIt<SignInCompanyCubit>(),
            child: LoginServiceProvider(),
          ));
        },
      ),
      GoRoute(
        path: RouteName.userInformationScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          bool isEditMode = state.extra as bool;
          return CustomSlideTransition(
            child: BlocProvider(
              create: (context) => getIt<UpdateUserInfoCubit>(),
              child: UserInformationScreen(isEditMode: isEditMode),
            ),
          );
        },
      ),
      GoRoute(
        path: RouteName.forgetPassword,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomSlideTransition(
            child: BlocProvider(
              create: (context) => getIt<ResetPassworCubit>(),
              child: const ForgetPasswordScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: RouteName.resetPasswordScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          int id = state.extra as int;
          return CustomSlideTransition(
            child: BlocProvider(
              create: (context) => getIt<UpdateUserInfoCubit>(),
              child: ResetPasswordScreen(id: id),
            ),
          );
        },
      ),
      GoRoute(
        path: RouteName.passwordChangedSuccess,
        builder: (BuildContext context, GoRouterState state) {
          return const PasswordChangedSuccessScreen();
        },
      ),
      GoRoute(
        path: RouteName.verificationEmailScreen,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<UpdateUserInfoCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<VerifyEmailCubit>()
                    ..resendCode(email: data['email']),
                )
              ],
              child: EmailVerifeCodeScreen(
                email: data['email'],
              ));
        },
      ),
      GoRoute(
        path: RouteName.verifyResetPasswordCode,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<ResetPassworCubit>())
              ],
              child: VerifyResetPasswrodScreen(
                email: data['email'],
              ));
        },
      ),
      GoRoute(
        path: RouteName.onBoardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: RouteName.home,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<MainCategorysCubit>()..getAllCategories(),
              ),
              BlocProvider(
                create: (context) => getIt<TrendCubit>()..getAllTrending(),
              ),
            ],
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.motorMart,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<MowaterMarketCubit>()..fetchProducts(),
              ),
              BlocProvider(create: (context) => getIt<CarBrandsCubit>()),
              BlocProvider(
                  create: (context) => getIt<MowaterMartAdsCubit>()..getAds())
            ],
            child: const MowaterMartScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.maintenanceServices,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<TrendingServiceCubit>()..getTrending(),
              ),
              BlocProvider(
                create: (context) => getIt<MaintenanceAdsCubit>(),
              ),
            ],
            child: MaintenanceServicesScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.parking,
        builder: (BuildContext context, GoRouterState state) {
          return const ParkingScreen();
        },
      ),
      GoRoute(
        path: RouteName.signInUser,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<SignInUserCubit>(),
            child: const SignInUserScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.service24,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<Service24Cubit>(),
            child: const Service24Screen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.parking,
        builder: (BuildContext context, GoRouterState state) {
          return const ParkingScreen();
        },
      ),
      GoRoute(
        path: RouteName.showYourCar,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<CarModelsBrandsCubit>()),
            ],
            child: const SellYourCarScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.rentingCars,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<RentalCarsAdsCubit>()..getAds(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<RentalCarsCompanysCubit>()..getAllCompanys(),
              ),
            ],
            child: const RentalCarsScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.spareParts,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<UsedSparePartsAdsCubit>()..getMainAds(),
            child: UsedSparePartsScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.sparePartsDetails,
        builder: (BuildContext context, GoRouterState state) {
          SpatepartsCompanyModel company =
              state.extra as SpatepartsCompanyModel;
          return SparePartCompanyDetailsScreen(
            company: company,
          );
        },
      ),
      GoRoute(
        path: RouteName.sparePartsScreen,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          int id = data['id'];
          String categoryName = data['categoryName'];
          print(id);
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<UsedSparePartsAdsCubit>()..getcategoryAds(id),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<SparePartsCategoryCubit>()..getCompanyAt(id: id),
              ),
            ],
            child: SparePartsCategoryScreen(
                categoryName: categoryName, categoryId: id),
          );
        },
      ),
      GoRoute(
        path: RouteName.mobileServiceCategory,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<AdsCubit>()..getAds('Mobile Service'),
            child: const MobileServiceCategoryScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.mobileService,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<MobileServiceAdsCubit>()..getAdsIn(data['id']),
              ),
              BlocProvider(
                create: (context) => getIt<MobileServiceCompaneisCubit>()
                  ..getCompanies(id: data['id']),
              ),
            ],
            child: MobileServicecreen(
                categoryName: data['categoryName'], id: data['id']),
          );
        },
      ),
      GoRoute(
        path: RouteName.parkingForm,
        builder: (BuildContext context, GoRouterState state) {
          ParkingModel parkingModel = state.extra as ParkingModel;
          return BlocProvider(
            create: (context) =>
                getIt<ParkingAdsCubit>()..getParkingAdsIn(parkingModel.id),
            child: ParkingFormScreen(
              parkingModel: parkingModel,
            ),
          );
        },
      ),
      GoRoute(
        path: RouteName.maintenaceServicesMotor,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          int id = data['id'];
          String categoryName = data['name'];

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<MerchantByIdCubit>()..getMerchantById(id: id),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<MaintenanceAdsCubit>()..getAds(id.toString()),
              ),
              BlocProvider(
                  create: (context) => getIt<CarBrandsCubit>()..getAllBrands()),
              BlocProvider(
                  create: (context) => getIt<MaintenanceSearchCubit>()),
            ],
            child: MaintenaceServicesMotorScreen(
                specialtyId: id, categoryName: categoryName),
          );
        },
      ),
      GoRoute(
        path: RouteName.mowaterMartProductDetails,
        builder: (BuildContext context, GoRouterState state) {
          MowaterMartProductModel product =
              state.extra as MowaterMartProductModel;
          return MowaterMartProductDetailsScreen(
            martProductModel: product,
          );
        },
      ),
      GoRoute(
        path: RouteName.carsForSale,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CarBrandsCubit>()..getAllBrands(),
              ),
              BlocProvider(
                create: (context) => getIt<CarForSaleCubit>()..fetchProducts(),
              ),
            ],
            child: const CarBrandsBody(),
          );
        },
      ),
      GoRoute(
        path: RouteName.carsScreeen,
        builder: (BuildContext context, GoRouterState state) {
          String name = state.extra as String;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CarForSaleCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<BrandAdsCubitCubit>()..getAds(),
              ),
            ],
            child: CarScreen(name: name),
          );
        },
      ),
      GoRoute(
        path: RouteName.carDetailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          CarProduct car = state.extra as CarProduct;
          return BlocProvider(
            create: (context) => getIt<RelatedCarCubit>()
              ..getRealted(car.id.toString(), car.carMake),
            child: CarDetailsScreen(car: car),
          );
        },
      ),
      GoRoute(
        path: RouteName.MaintenanceDetailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          MaintenanceCompanyModel companyModel =
              state.extra as MaintenanceCompanyModel;
          return MaintenanceDetailsScreen(
              maintenanceCompanyModel: companyModel);
        },
      ),
      GoRoute(
        path: RouteName.carBrandsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<CarBrandsCubit>()..getAllBrands(),
            child: const CarAllBrandsScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.carCareCategorys,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CarCareCategoryAdsCubit>()
                  ..getCategoryAds(data['id']),
              ),
              BlocProvider(
                create: (context) => getIt<CarCareCompaniesCubit>()
                  ..getCompanies(id: data['id']),
              ),
            ],
            child: CarCarScreen(
                categoryName: data['categoryName'], id: data['id']),
          );
        },
      ),
      GoRoute(
        path: RouteName.carCare,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<AdsCubit>()..getAds('carCare'),
            child: const CarCareCategorysScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.carEvaluation,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<CarModelsBrandsCubit>(),
            child: const EvaluationScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.carShowrooms,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ShowRoomsAdsCubit>()..getAds(),
              ),
              BlocProvider(
                create: (context) => getIt<ShowRoomsCubit>()..getAllShowRooms(),
              ),
            ],
            child: const ShowRoomsScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.showRoomDetails,
        builder: (BuildContext context, GoRouterState state) {
          ShowroomModel showroom = state.extra as ShowroomModel;
          return ShowRoomDetailsScreen(shoowRoom: showroom);
        },
      ),
      GoRoute(
        path: RouteName.carInsurance,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<InsurancAdsCubit>()..getMianAds(),
            child: const InsuranceScreen(),
          );
        },
      ),

      //auth
      GoRoute(
        path: RouteName.loginUserScreen,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
              ),
              BlocProvider(
                create: (context) => GoogleSignInCubit(),
              ),
            ],
            child: const LoginUserScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.verificationCodeScreen,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<OtpVerifyCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ResendOtpCubit>(),
              ),
            ],
            child: VerificationCodeScreen(
                number: data['number'], numberType: data['numberType']),
          );
        },
      ),
      GoRoute(
        path: RouteName.rentalCarCompanyDetials,
        builder: (BuildContext context, GoRouterState state) {
          CompanyRentalCarsModel companyRentalCarsModel =
              state.extra as CompanyRentalCarsModel;
          return RentalCarCompanyDetailsScreen(
            company: companyRentalCarsModel,
          );
        },
      ),
      GoRoute(
        path: RouteName.brokers,
        builder: (BuildContext context, GoRouterState state) {
          int categoryId = state.extra as int;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<InsurancAdsCubit>()..getAdsInCategory(categoryId),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<InsuranceProviderServiceCubit>()..getProviders(1),
              )
            ],
            child: const BorkersScreen(),
          );
        },
      ),

      GoRoute(
        path: RouteName.companies,
        builder: (BuildContext context, GoRouterState state) {
          int categoryId = state.extra as int;
          return MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) =>
                    getIt<InsurancAdsCubit>()..getAdsInCategory(categoryId)),
            BlocProvider(
              create: (context) =>
                  getIt<InsuranceProviderServiceCubit>()..getProviders(0),
            )
          ], child: const CompaniesScreen());
        },
      ),
      GoRoute(
        path: RouteName.requestAquate,
        builder: (BuildContext context, GoRouterState state) {
          int categoryId = state.extra as int;
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  getIt<InsurancAdsCubit>()..getAdsInCategory(categoryId),
            ),
            BlocProvider(create: (context) => getIt<CarModelsBrandsCubit>()),
            BlocProvider(create: (context) => getIt<AddNewCarInsuranceCubit>()),
          ], child: const RequestAquateScreen());
        },
      ),
      GoRoute(
        path: RouteName.rentCarDetails,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> cars = state.extra as Map<String, dynamic>;
          return RentCarDetailsScreen(
            car: cars['car'],
            cars: cars['cars'],
          );
        },
      ),
      GoRoute(
        path: RouteName.carNumbers,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<PlateAdsCubit>()..getMainAds(),
            child: const CarNumbersScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.addAccountNumber,
        builder: (BuildContext context, GoRouterState state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AccountNumberCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<UpdateUserInfoCubit>(),
              ),
            ],
            child: AddAccountNumberScreen(
              userToken: data['token'],
              numberType: data['numberType'],
            ),
          );
        },
      ),

      GoRoute(
        path: RouteName.platesForSaleScreen,
        builder: (BuildContext context, GoRouterState state) {
          PlateCodeWidget plate = state.extra as PlateCodeWidget;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<PlateCategoryCubit>()
                  ..getCategory(source: plate.categoryName),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<PlateAdsCubit>()..getAdsInCategory(plate.id),
              ),
            ],
            child: PlateForSaleScreen(plate: plate),
          );
        },
      ),

      GoRoute(
        path: RouteName.addPlate,
        builder: (BuildContext context, GoRouterState state) {
          return const AddNewPlateScreen();
        },
      ),
      GoRoute(
        path: RouteName.sellYourPlate,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<SellYouPlateCubit>(),
            child: const SellYourPlateScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.platesScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const PlateScreen();
        },
      ),
      GoRoute(
        path: RouteName.warranty,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AdsCubit>()..getAds('warranty'),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<WarrantyCompaniesCubit>()..getCompanies(),
              ),
            ],
            child: WarrantyScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.carInspection,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<InspectionAdsCubit>()..getAds(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<InspectionCompanyeCubit>()..getCompany(),
              ),
            ],
            child: InspetionScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteName.inspectionCompanyDetails,
        builder: (BuildContext context, GoRouterState state) {
          InspectionCompanyModel company =
              state.extra as InspectionCompanyModel;
          return InspectionCompanyDetailsScreen(
            company: company,
          );
        },
      ),
      GoRoute(
        path: RouteName.editNormalCompanyProfile,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<EditeNormalCompanyCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ProviderServiceAuthCubit>(),
              ),
            ],
            child: const EditNormalCompanyProfile(),
          );
        },
      ),
      GoRoute(
        path: RouteName.showRoomMyCars,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<ShowRoomMyCarsCubit>()
              ..getMyCars(UserServices.getUserInformation().id!),
            child: const ShowRoomMyCars(),
          );
        },
      ),

      GoRoute(
        path: RouteName.showRoomAddEditCar,
        builder: (BuildContext context, GoRouterState state) {
          CarProduct? car = state.extra as CarProduct;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CarModelsBrandsCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ShowRoomAddEditCubit>(),
              ),
            ],
            child: ShowRoomMyCarsAddEditScreen(
              carModelProduct: car,
            ),
          );
        },
      ),
    ],
    redirect: (context, state) {
      if (isCheckd == false &&
          UserServices.checkToken() &&
          UserServices.getUserInformation().email != null &&
          UserServices.getUserInformation().email!.isNotEmpty &&
          UserServices.getUserInformation().emailState != 0) {
        isCheckd = true;
        // return RouteName.home;
      } else if (isCheckd == false &&
          NormalCompanyService.getCompanyData().id != null &&
          NormalCompanyService.getCompanyData().id!.isNotEmpty) {
        isCheckd = true;
        return RouteName.home;
      }

      return null;
    },
  );
}
