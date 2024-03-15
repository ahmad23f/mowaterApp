import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/filter_icon.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/years_dropdown.dart';
import 'package:Mowater/Features/UsedSpareParts/presentation/widgets/filter_bootm_sheet_state_product.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/Features/mowaterMart/data/model/mowater_mart_product_model.dart';
import 'package:Mowater/Features/mowaterMart/presentation/cubits/mowaterMartAds/cubit/mowater_mart_ads_cubit.dart';
import 'package:Mowater/Features/mowaterMart/presentation/cubits/mowaterMartCubit/mowater_market_cubit.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/mowater_success_body.dart';
import 'package:Mowater/Features/mowaterMart/presentation/widget/product_loading_widget.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/loading_trending.dart';
import 'package:Mowater/core/widgets/search_form_widget.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class MowaterMartBody extends StatefulWidget {
  const MowaterMartBody({Key? key}) : super(key: key);

  @override
  State<MowaterMartBody> createState() => _MowaterMartBodyState();
}

class _MowaterMartBodyState extends State<MowaterMartBody> {
  int selectedState = 0;
  int selectedYear = 0;
  int selectedCarId = 0;
  TextEditingController searchController = TextEditingController();
  TextEditingController carNameController = TextEditingController();

  bool isLoading = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_addListener);
    super.initState();
  }

  _addListener() async {
    if (!isLoading &&
        scrollController.position.extentAfter <
            MediaQuery.of(context).size.height * 0.4 &&
        searchController.text.isEmpty &&
        carNameController.text.isEmpty &&
        selectedYear == 0) {
      print('get');
      isLoading = true;

      await context.read<MowaterMarketCubit>().loadMoreProducts();

      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MowaterMarketCubit, MowaterMarketState>(
      builder: (mcontext, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              SizedBox(
                width: 250.w,
                child: ModernSearchContainer(
                    controller: searchController,
                    hintText: 'search',
                    icon: Icons.abc,
                    onChange: (p0) {
                      searchController.text = p0;
                      context
                          .read<MowaterMarketCubit>()
                          .searchProducts(searchQuery: p0);
                    },
                    widget: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => buildFiltersSheet(
                              mcontext,
                            ),
                          );
                        },
                        icon: FilterIcon())),
              )
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                verticalSpace(12.h),
                BlocBuilder<MowaterMartAdsCubit, MowaterMartAdsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      success: (ads) {
                        return CarouselSlider.builder(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                          ),
                          itemCount: ads.length,
                          itemBuilder: (context, index, realIndex) =>
                              TrendingWidget(
                            image: ads[index].image,
                          ),
                        );
                      },
                      loading: () => const LoadingTrendinglistView(),
                      faliure: () => const SizedBox(),
                    );
                  },
                ),
                verticalSpace(20.h),
                buildFilterWidgets(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildFiltersSheet(
    BuildContext context,
  ) {
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
            Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product State",
                        style: TextStyles.text_16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedCarId = 0;
                            selectedState = 3;
                            selectedYear = 0;
                          });
                        },
                        child: InkWell(
                          onTap: () async {
                            context.pop();
                            await context
                                .read<MowaterMarketCubit>()
                                .fetchProducts();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyles.text_16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorApp.primeryColorDark,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                  ProductStateFilter(
                    selectedState: [
                      'All',
                      'New',
                      'Used',
                    ][selectedState == 3 ? 0 : selectedState + 1],
                    states: const ['All', 'Used', 'New'],
                    onSelected: (newState) {
                      if (newState == 'New') {
                        selectedState = 0;
                      } else if (newState == 'Used') {
                        selectedState = 1;
                      } else if (newState == 'All') {
                        selectedState = 3;
                      }
                    },
                  ),
                  verticalSpace(20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Year',
                        style: TextStyles.text_16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(10.h),
                      YearDropdown(
                        initialValue: selectedYear == 0
                            ? DateTime.now().year
                            : selectedYear,
                        onChanged: (newState) {
                          selectedYear = newState;
                        },
                      ),
                    ],
                  ),
                  verticalSpace(20.h),
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
                        SizedBox(
                          child: CarNameDropDownWidget(
                            carNameController: carNameController,
                            onChanged: (p0) {
                              setState(() {
                                selectedCarId = p0!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: CustomButton(
                      textStyle:
                          TextStyles.text_18.copyWith(color: Colors.white),
                      color: ColorApp.primeryColorDark,
                      text: 'Apply',
                      onPressed: () async {
                        Navigator.pop(context);

                        context.read<MowaterMarketCubit>().searchProducts(
                            carType: selectedCarId,
                            productState: selectedState,
                            year: selectedYear != 0 ? selectedYear : null);
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

  Widget buildFilterWidgets(BuildContext mcontext, MowaterMarketState state) {
    return state.when(
      initial: () => const Text(''),
      success: (data) {
        final adsData = checkifAds(data);
        final nonAdsData = data.where((product) => product.isAds == 0).toList();
        final sortedData = [...adsData, ...nonAdsData];
        return sortedData.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    MowaterMartSuccessBody(mowaterMartProducts: sortedData),
                    buildLoadingIndicator(), // Add loading indicator here
                  ],
                ),
              )
            : const SizedBox();
      },
      failure: (messages) => Center(
        child: Column(
          children: [
            Lottie.asset(
              'assets/animation/no_found.json',
            ),
            CustomButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => buildFiltersSheet(mcontext));
              },
              color: ColorApp.primeryColorDark,
              textStyle: TextStyles.text_18.copyWith(color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
              text: 'Try different filters',
            )
          ],
        ),
      ),
      loading: () => const LoadingProductWidget(),
    );
  }

  Widget buildLoadingIndicator() {
    return BlocBuilder<MowaterMarketCubit, MowaterMarketState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          success: (data) => const SizedBox.shrink(),
          failure: (messages) => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(), // Circular progress indicator
          ),
        );
      },
    );
  }

  Widget buildFilteredProducts(List<MowaterMartProductModel> filteredProducts) {
    return Column(
      children: filteredProducts
          .map((product) => ListTile(
                title: Text(
                    product.prodectType ?? ''), // Display product information
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      filteredProducts.remove(product);
                    });
                  },
                ),
              ))
          .toList(),
    );
  }

  Future applyFilters(BuildContext context) async {
    setState(() {}); // Update the UI after applying filters
    isLoading = false;
  }

  applySearchFilters(BuildContext context) async {
    // Reset the pageMain variable to 1 when applying search filters
    context.read<MowaterMarketCubit>().pageMain = 1;

    await context.read<MowaterMarketCubit>().fetchProducts(
          searchQuery: searchController.text,
        );
    setState(() {}); // Update the UI after applying search filters
  }
}

List<MowaterMartProductModel> checkifAds(
    List<MowaterMartProductModel> productModel) {
  return productModel.where((product) => product.isAds == 1).toList();
}
