import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cubit/CarForSale/car_for_sale_cubit.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_widet.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/filter_icon.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/top_car_brands_list_view.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/widgets/chip_chose.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:Mowater/Features/UsedSpareParts/presentation/widgets/filter_bootm_sheet_country.dart';
import 'package:Mowater/Features/carNumbers/presntation/widgets/price_slider.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/search_form_widget.dart';

class CarBrandsBody extends StatefulWidget {
  const CarBrandsBody({
    Key? key,
  }) : super(key: key);

  @override
  _CarBrandsBodyState createState() => _CarBrandsBodyState();
}

class _CarBrandsBodyState extends State<CarBrandsBody> {
  late TextEditingController searchController;
  late int _pageNumber;
  late int _displayedCarsCount;
  bool isLoading = false;
  late ScrollController scrollController;
  RangeValues? selectedMinMaxPrice;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_addListener);

    searchController = TextEditingController();
    _pageNumber = 1;
  }

  _addListener() async {
    if (!isLoading &&
        scrollController.position.extentAfter <
            MediaQuery.of(context).size.height * 0.4 &&
        searchController.text.isEmpty &&
        selectedMinMaxPrice == null &&
        selectedCarModel == 0 &&
        selectedLocation == '') {
      isLoading = true;

      await context.read<CarForSaleCubit>().loadMoreProducts(page: _pageNumber);
      isLoading = false;
      _pageNumber++;
      setState(() {});
    }
  }

  int selectedCarModel = 0;
  String selectedLocation = '';
  TextEditingController carForSaleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppBar CarForSaleBar(BuildContext mcontext) {
      return AppBar(
        title: Text(
          "Cars For Sale",
          style: TextStyles.text_14,
        ),
        actions: [
          SizedBox(
            height: 60,
            width: 200.w,
            child: ModernSearchContainer(
              controller: searchController,
              hintText: 'Search',
              onChange: (p0) async {
                await context
                    .read<CarForSaleCubit>()
                    .searchProducts(searchQuery: p0);
              },
              icon: Icons.search,
              widget: Padding(
                padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 10.h),
                child: InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                      context: mcontext,
                      builder: (context) => FilterBottmSheet(context, mcontext),
                    );
                  },
                  child: FilterIcon(),
                ),
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: CarForSaleBar(context),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20.h),
            Column(children: [
              const TopBrandsListTitleWithListView(),
              const TopCarBrandsListview(),
              verticalSpace(mainPadding),
              Row(
                children: [
                  Text(
                    'New Cars',
                    style: TextStyles.text_16.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    Icons.local_fire_department_outlined,
                    color: ColorApp.primeryColorDark,
                  ),
                ],
              ),
              allCarsInAllBrandsListView(context)
            ]),
          ],
        ),
      ),
    );
  }

  Container FilterBottmSheet(BuildContext context, BuildContext mcontext) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.secondary,
        boxShadow: const [
          BoxShadow(spreadRadius: 2, blurRadius: 20),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 105, 105, 105),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                children: [
                  EmirateNameCountryFilter(
                    emirates: emirates,
                    selectedEmirate: selectedLocation,
                    onSelected: (newEmara) async {
                      selectedLocation = newEmara;
                    },
                  ),
                  verticalSpace(mainPadding),
                  SizedBox(
                    width: mediasize(context).width,
                    height: 120.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Car Make',
                          style: TextStyles.text_16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        verticalSpace(10.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: CarNameDropDownWidget(
                              carNameController: carForSaleController,
                              onChanged: (p0) {
                                selectedCarModel = p0!;
                                print(p0);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PriceSliderPlate(
                    showForm: false,
                    maxPrice: 100000,
                    initialRangeValues: const RangeValues(0, 100000),
                    onChanged: (value) {
                      selectedMinMaxPrice = value;
                    },
                  ),
                  verticalSpace(40.h),
                  Center(
                    child: CustomButton(
                      textStyle:
                          TextStyles.text_18.copyWith(color: Colors.white),
                      color: ColorApp.primeryColorDark,
                      text: 'Apply',
                      onPressed: () async {
                        // context.pop();
                        await mcontext.read<CarForSaleCubit>().searchProducts(
                            location: selectedLocation,
                            carType: selectedCarModel,
                            maxPrice: '${selectedMinMaxPrice?.end}',
                            minPrice: "${selectedMinMaxPrice?.start}");
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 10),
                    ),
                  ),
                  verticalSpace(40.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget allCarsInAllBrandsListView(BuildContext mcontext) =>
      BlocBuilder<CarForSaleCubit, CarForSaleState>(
        builder: (context, state) {
          return state.when(
            successCategoryName: (name) {
              return const Text('data');
            },
            initial: () => const Text('init'),
            success: (data) {
              return data.isNotEmpty
                  ? ListView.builder(
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 6.dg,
                              ),
                              child: InkWell(
                                onTap: () {
                                  context.push(
                                    RouteName.carDetailsScreen,
                                    extra: data[index],
                                  );
                                },
                                child: CarWidget(car: data[index]),
                              ),
                            ),
                          ],
                        );
                      })
                  : Center(
                      child: Column(
                        children: [
                          Lottie.asset(
                            'assets/animation/no_found.json',
                          ),
                          CustomButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return FilterBottmSheet(context, mcontext);
                                  });
                            },
                            color: ColorApp.primeryColorDark,
                            textStyle: TextStyles.text_18
                                .copyWith(color: Colors.white),
                            padding: EdgeInsets.symmetric(
                                horizontal: 60.w, vertical: 10.h),
                            text: 'Try different filters',
                          )
                        ],
                      ),
                    );
            },
            faliure: (error) => Center(
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animation/no_found.json',
                  ),
                  CustomButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container();
                          });
                    },
                    color: ColorApp.primeryColorDark,
                    textStyle: TextStyles.text_18.copyWith(color: Colors.white),
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                    text: 'Try different filters',
                  )
                ],
              ),
            ),
            loading: () => const CircularProgressIndicator.adaptive(),
          );
        },
      );
}

class TopBrandsListTitleWithListView extends StatelessWidget {
  const TopBrandsListTitleWithListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Brands',
          style: TextStyles.text_16.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        InkWell(
          onTap: () {
            context.push(
              RouteName.carBrandsScreen,
            );
          },
          child: Text(
            'See More',
            style: TextStyles.text_16.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorApp.primeryColorDark,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
