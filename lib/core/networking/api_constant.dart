class ApiConstans {
  static const String baseUrl = 'https://moawteruae.site/MowaterBackEnd/';
  static const String trending = 'trending/get_trending.php';
  static const String mainCategorys = 'categorys/get_all_category.php';
  static const String types = "categorys/get_types.php";

//mowaterApp mart

  static const String fuelPrice = 'FuelPrice/price.php';
  static const String mobileServiceCompanies =
      'mobileService/get_companies.php';

  static const String mowaterMarket = 'categorys/get_mowater_market.php';
  static const String mowaterMartSearch =
      "categorys/search_in_mowater_mart.php";
  static const String mowaterMartAds = "categorys/mowater_mart_ads.php";
  static const String warrantyAds = "warranty/ads.php";
  static const String getWarrantyCompanies = "warranty/get_company.php";
  static const String getCarCareCategoryAds = "core/ads_category.php";
  static const String getCarCareCategoryCompanies = "carCare/get_companies.php";
  static const String mobileServiceCategoryAds =
      "mobileService/ads_in_category.php";
//
  static const String service24NearestRecovery =
      "24Service/near_recovery_companies.php";

  static const String maintenanceServicesById =
      'MaintenanceServices/getServicesByCategoryId.php';

  static const String searchInMaintenance =
      'MaintenanceServices/search_in_maintenance.php';
  static const String getTrendtingInMaintence =
      'MaintenanceServices/getTrendMaintenanceCategory.php';
  static const String trendingService =
      'MaintenanceServices/getTrendingService.php';
  static const String getRelatedProduct = "categorys/get_related_product.php";

  //brands
  static const String getAllCarBrands = 'carsForSlae/get_car_brands.php';
  static const String getAllModelBrands = 'carsForSlae/sub_car_brand.php';
  static const String searchInBrandsCar = 'carsForSlae/filter_serach_cars.php';

  //car for sale
  static const String getAllCarForSale = 'carsForSlae/get_cars.php';
  static const String getRelatedCars = 'carsForSlae/get_related_cars.php';
  //cars by brand
  static const String getCarsByCategory = 'CarsForSale/Cars/cars_for_sales.php';
  static const String getImageForCar = 'CarsForSale/Cars/get_cars_image.php';

  //add new car
  static const String addNewCar = 'CarsForSaleold/add_cars.php';
  static const String addNewCarInsurance =
      'insurance/add_new_car_insurance.php';
  static const String getAllCarsForSale =
      'carsForSlae/get_all_cars_for_sale.php';

  static const String fuelTypes = 'carsForSlae/fuel_types.php';

  static const String carForSaleFiltering = 'carsForSlae/filtering_car.php';

  static const String getCarCategoryName =
      "CarsForSale/Cars/get_car_category.php";

  static const String imageCars =
      'https://moawteruae.site/MowaterBackEnd/upload/';
  static const String userImage =
      'https://moawteruae.site/MowaterBackEnd/usersImage/';
  static const String companyImage =
      'https://moawteruae.site/MowaterBackEnd/companiesInformation/';
  static const String showRoomCarsImages =
      'https://moawteruae.site/MowaterBackEnd/showRoomsCarsImages/';

  //parking

  static const String parkingAds = 'parking/parking_ads.php';
  static const String mainParkingAds = 'parking/mainParkingAds.php';

  //evealuation
  static const String evaluation = 'parking/parking_ads.php';

  ///      ADS ////
  static const String brandsAds = 'carsForSlae/ads_in_brands.php';
  static const String insuraceAds = 'insurance/get_main_ads.php';
  static const String ads = 'core/ads.php';

  ///insurance
  static const String insuranceAdsInCategory =
      'insurance/get_ads_in_category.php';
  static const String insuranceproviders = 'insurance/get_provider_service.php';

  ///show rooms

  static const String allShowRooms = 'showRooms/get_all_show_rooms.php';

  //auth
  static const String signUpUser = 'auth/sign_up.php';
  static const String updatePhoneNumberUser = 'auth/update_phone_number.php';
  static const String verifyCode = 'auth/verfiycode.php';
  static const String updateUserInfo = 'auth/update_user_information.php';
  static const String signInUser = 'auth/sign_in.php';
  static const String resendCode = 'auth/resend_code.php';
  static const String resendEmailCode = 'auth/resend_email_code.php';
  static const String forgetPassword = 'auth/forget_password.php';

//rental cars
  static const String getAllCompanyRentalCars =
      'RentalCars/get_all_companys_rental_cars.php';

  static const String getPlateCategry = "plateNumbers/plate_category.php";

  static const String getPlateAdsInCateogry =
      "plateNumbers/get_ads_for_country.php";
  static const String sellYourPlate = "plateNumbers/sell_your_plate.php";

  //sparePart
  static const String sparePartsCompanyByCategory =
      'spareParts/get_all_company_in_category.php';
  static const String plateMainAds = "plateNumbers/main_ads.php";

  //

  //ads
  static const String showRoomsAds = 'showRooms/get_ads.php';
  static const String inspectionAds = 'inspection/ads.php';

  static const String inspectionCompanye = "inspection/get_companye.php";

  static const String rentalCarsAds = 'RentalCars/get_rental_ads.php';
  static const String sparePartsMainAds = 'spareParts/main_ads.php';
  static const String sparePartsCategoryAds = 'spareParts/categorys_ads.php';
  static const String emailVerify = 'auth/verify_email.php';
  static const String verifyResetPasswordCode =
      'auth/verify_reset_password.php';

  // service provider
  static const String addServiceProviderMaintenance =
      'serviceProviderAuth/registerCompanies.php';
  static const String signInServiceProvider = 'serviceProviderAuth/sign_in.php';
  static const String addShowRoomCompany = 'showRooms/add_new_company.php';
  static const String showRoomGetMeCars = 'showRooms/get_my_cars.php?companyId';
  static const String showRoomEditAddCar = 'showRooms/add_new_car.php';
  static const String editProfileNormalCompany =
      'serviceProviderProfileUpdate/update_normal_company.php';
  static const String addSparePartCompany = 'spareParts/add_company.php';
  static const String addProductSpareParts = 'spareParts/add_new_product.php';
  static const String getMyProductSpareParts = 'spareParts/get_my_prodcuts.php';
}
