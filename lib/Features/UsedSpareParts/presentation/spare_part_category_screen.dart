import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/filter_icon.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/widgets/chip_chose.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/widgets/company_loading_widget.dart';
import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/Cubits/spareParts/spare_parts_category_cubit.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/ads/used_spare_parts_ads_cubit.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/widgets/filter_bootm_sheet_country.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/widgets/filter_bootm_sheet_state_product.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/widgets/spare_part_company.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';
import 'package:mowaterApp/core/widgets/error_ads_widget.dart';
import 'package:mowaterApp/core/widgets/loading_trending.dart';
import 'package:mowaterApp/core/widgets/search_form_widget.dart';

class SparePartsCategoryScreen extends StatefulWidget {
  String categoryName;
  int categoryId;
  SparePartsCategoryScreen(
      {Key? key, required this.categoryName, required this.categoryId})
      : super(key: key);

  @override
  State<SparePartsCategoryScreen> createState() =>
      _SparePartsCategoryScreenState();
}

class _SparePartsCategoryScreenState extends State<SparePartsCategoryScreen> {
  String selectedEmirates = '';
  int selectedStates = 3;
  int selectedCarId = 0;
  TextEditingController carNameController = TextEditingController();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext mcontext) {
    return BlocBuilder<UsedSparePartsAdsCubit, UsedSparePartsAdsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(
            child: Text(' '),
          ),
          success: (ads) => Scaffold(
            appBar: SparePartBar(mcontext),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(20.h),
                  CarouselSlider.builder(
                    itemCount: ads.length,
                    itemBuilder: (context, index, realIndex) =>
                        TrendingWidget(image: ads[index].image),
                    options: CarouselOptions(viewportFraction: 1),
                  ),
                  Divider(
                    height: 20.h,
                    indent: 20,
                    endIndent: 20,
                  ),
                  BlocBuilder<SparePartsCategoryCubit, SparePartsCategoryState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(
                          child: Text(''),
                        ),
                        succss: (companies) => companies.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(mainPadding),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: companies.length,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () => context.push(
                                      RouteName.sparePartsDetails,
                                      extra: companies[index],
                                    ),
                                    child: SparePartCompanyWidget(
                                      company: companies[index],
                                    ),
                                  ),
                                ),
                              )
                            : _buildNoProductsFound(),
                        faliure: () => Container(
                          child: Text(
                            "There was an unknown error. We'll fix it soon.",
                            style: TextStyles.text_18,
                          ),
                        ),
                        loading: () => const CompanyLoadingList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          loading: () => Scaffold(
            appBar: AppBar(
              title: Text(
                widget.categoryName,
                style: TextStyles.text_14,
              ),
            ),
            body: CarouselSlider.builder(
              options: CarouselOptions(viewportFraction: 1),
              itemCount: 1,
              itemBuilder: (context, index, realIndex) =>
                  const LoadingTrendingWidget(),
            ),
          ),
          faliure: () => Scaffold(
            appBar: AppBar(),
            body: const ErrorAdsWidgte(),
          ),
        );
      },
    );
  }

  Widget _buildNoProductsFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.not_listed_location_outlined,
            size: 50,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          const Text(
            'No products found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Try another search'),
          ),
        ],
      ),
    );
  }

  AppBar SparePartBar(BuildContext mcontext) {
    return AppBar(
      title: Text(
        widget.categoryName,
        style: TextStyles.text_14,
      ),
      actions: [
        SizedBox(
          height: 60,
          width: 200.w,
          child: ModernSearchContainer(
            controller: searchController,
            hintText: 'Search',
            onChange: (p0) {
              print(widget.categoryId);
              context.read<SparePartsCategoryCubit>().getCompanyAt(
                    id: widget.categoryId,
                    searchQuery: p0,
                  );
            },
            icon: Icons.search,
            widget: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 10.h),
              child: InkWell(
                onTap: () async {
                  showModalBottomSheet(
                    context: mcontext,
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorApp.secunderyColorDark,
                        boxShadow: const [
                          BoxShadow(spreadRadius: 2, blurRadius: 20),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 100),
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Product State",
                                        style: TextStyles.text_16.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          context.pop();

                                          await mcontext
                                              .read<SparePartsCategoryCubit>()
                                              .getCompanyAt(
                                                id: widget.categoryId,
                                              );
                                        },
                                        child: Text(
                                          "Reset",
                                          style: TextStyles.text_16.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: ColorApp.primeryColorDark),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(10.h),
                                  ProductStateFilter(
                                    selectedState: [
                                      'All',
                                      'Used',
                                      'New'
                                    ][selectedStates == 3 ? 0 : selectedStates],
                                    states: const ['All', 'Used', 'New'],
                                    onSelected: (newState) {
                                      if (newState == 'Used') {
                                        selectedStates = 1;
                                      } else if (newState == 'New') {
                                        selectedStates = 2;
                                      } else if (newState == 'All') {
                                        selectedStates = 3;
                                      }
                                    },
                                  ),
                                  verticalSpace(40.h),
                                  EmirateNameCountryFilter(
                                    emirates: emirates,
                                    selectedEmirate: selectedEmirates,
                                    onSelected: (newEmara) async {
                                      selectedEmirates = newEmara;
                                    },
                                  ),
                                  verticalSpace(40.h),
                                  SizedBox(
                                    width: mediasize(context).width,
                                    height: 120.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Car Make',
                                          style: TextStyles.text_16.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        verticalSpace(10.h),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 320.w,
                                            child: CarNameDropDownWidget(
                                              carNameController:
                                                  carNameController,
                                              onChanged: (p0) {
                                                selectedCarId = p0!;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: CustomButton(
                                      textStyle: TextStyles.text_18
                                          .copyWith(color: Colors.white),
                                      color: ColorApp.primeryColorDark,
                                      text: 'Apply',
                                      onPressed: () async {
                                        context.pop();
                                        await _applyFilters(mcontext);
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
                    ),
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

  Future<void> _applyFilters(BuildContext context) async {
    print(selectedStates);
    if (selectedStates == 3) {
      await context.read<SparePartsCategoryCubit>().getCompanyAt(
          id: widget.categoryId,
          country: selectedEmirates,
          // carModelId: selectedCarId,
          state: selectedStates);
    } else if (selectedStates == 2) {
      await context.read<SparePartsCategoryCubit>().getCompanyAt(
          id: widget.categoryId,
          country: selectedEmirates,
          // carModelId: selectedCarId,
          state: 0);
    } else {
      await context.read<SparePartsCategoryCubit>().getCompanyAt(
          id: widget.categoryId,
          country: selectedEmirates,
          // carModelId: selectedCarId,
          state: selectedStates);
    }
  }
}
