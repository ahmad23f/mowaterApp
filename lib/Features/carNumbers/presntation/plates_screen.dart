import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plateCateogry/plate_category_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/widgets/plate_length.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';
import 'package:mowaterApp/core/widgets/error_ads_widget.dart';
import 'package:mowaterApp/core/widgets/loading_trending.dart';
import 'package:mowaterApp/core/widgets/search_form_widget.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/filter_icon.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plateAds/plate_ads_cubit.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/widgets/plate_widget.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/widgets/plate_widget_for_sale.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/widgets/price_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlateForSaleScreen extends StatefulWidget {
  PlateCodeWidget plate;

  PlateForSaleScreen({
    required this.plate,
    Key? key,
  }) : super(key: key);

  @override
  _PlateForSaleScreenState createState() => _PlateForSaleScreenState();
}

class _PlateForSaleScreenState extends State<PlateForSaleScreen> {
  TextEditingController searchController = TextEditingController();
  RangeValues? selectedValues;
  int seleteclength = 4;

  RangeValues? initialRangeValues; // Store initial range values here

  @override
  Widget build(BuildContext mContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.plate.categoryName} Numbers",
          style: TextStyles.text_12.copyWith(fontSize: 12.sp),
        ),
        actions: [
          SizedBox(
            width: 200.w,
            child: ModernSearchContainer(
              keyboardType: TextInputType.number,
              onChange: (p0) async {
                print(widget.plate.categoryName);
                await mContext.read<PlateCategoryCubit>().getCategory(
                      source: widget.plate.categoryName,
                      plateNumber: p0,
                      maxPrice: selectedValues?.end.toString(),
                      minPrice: selectedValues?.start.toString(),
                    );
                setState(() {});
              },
              controller: searchController,
              hintText: 'Search By Number',
              icon: Icons.search,
              widget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        child: Padding(
                          padding: const EdgeInsets.all(mainPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Length Of Plate",
                                    style: TextStyles.text_18
                                        .copyWith(fontSize: 18.sp),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      mContext.pop();
                                      await mContext
                                          .read<PlateCategoryCubit>()
                                          .getCategory(
                                            source: widget.plate.categoryName,
                                          );
                                    },
                                    child: Text(
                                      "Rest",
                                      style: TextStyles.text_20.copyWith(
                                          color: ColorApp.primeryColorDark),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpace(20.h),
                              SingleSelectionContainerGroup(
                                numberOfContainers: 5,
                                selectedIndex: seleteclength,
                                onChanged: (int selectedIndex) {
                                  setState(() {
                                    seleteclength = selectedIndex;
                                  });
                                },
                              ),
                              verticalSpace(40.h),
                              PriceSliderPlate(
                                maxPrice: 100000,
                                initialRangeValues: initialRangeValues ??
                                    const RangeValues(0,
                                        100000), // Use initial range values here
                                onChanged: (value) {
                                  selectedValues = value;
                                },
                              ),
                              Center(
                                child: CustomButton(
                                  onPressed: () async {
                                    mContext.pop();

                                    await mContext
                                        .read<PlateCategoryCubit>()
                                        .getCategory(
                                          source: widget.plate.categoryName,
                                          minPrice: selectedValues?.start
                                              .toInt()
                                              .toString(),
                                          maxPrice: selectedValues?.end
                                              .toInt()
                                              .toString(),
                                          plateLength: seleteclength + 1,
                                        );
                                  },
                                  color: ColorApp.primeryColorDark,
                                  textStyle: TextStyles.text_18.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 100.h,
                                  ),
                                  text: 'Apply',
                                ),
                              ),
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<PlateAdsCubit, PlateAdsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  success: (ads) => CarouselSlider.builder(
                    itemCount: ads.length,
                    itemBuilder: (context, index, realIndex) =>
                        TrendingWidget(image: ads[index].image),
                    options: CarouselOptions(viewportFraction: 1),
                  ),
                  faliure: () => const ErrorAdsWidgte(),
                  loading: () => const LoadingTrendingWidget(),
                );
              },
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              height: 20.h,
            ),
            BlocBuilder<PlateCategoryCubit, PlateCategoryState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  success: (plates) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: plates.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlateForSaleWidget(plate: plates[index]),
                      ),
                    ),
                  ),
                  faliure: () => Center(
                    child: Text(
                      "No Plates Try Without Filtering ! ",
                      style: TextStyles.text_14,
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
