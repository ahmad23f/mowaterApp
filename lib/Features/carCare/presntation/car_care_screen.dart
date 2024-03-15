import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/filter_icon.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/widgets/chip_chose.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/widgets/company_loading_widget.dart';
import 'package:Mowater/Features/UsedSpareParts/presentation/widgets/filter_bootm_sheet_country.dart';
import 'package:Mowater/Features/carCare/presntation/cubit/car_care_companies_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/services/ads_category.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/company_widget.dart';
import 'package:Mowater/core/widgets/search_form_widget.dart';

class CarCarScreen extends StatelessWidget {
  final String categoryName;
  final int id;

  CarCarScreen({Key? key, required this.categoryName, required this.id})
      : super(key: key);

  TextEditingController searchController = TextEditingController();
  String selectedEmara = 'dubai'.tr();
  @override
  Widget build(BuildContext mcontext) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(
              categoryName,
              style: TextStyles.text_14.copyWith(fontSize: 14.sp),
            ),
            actions: [
              SizedBox(
                height: 60.w,
                width: 200.w,
                child: ModernSearchContainer(
                  controller: searchController,
                  hintText: 'Search'.tr(),
                  onChange: (p0) {
                    mcontext.read<CarCareCompaniesCubit>().search(
                          id: id,
                          search: p0,
                        );
                  },
                  icon: Icons.search,
                  widget: Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 20.w, bottom: 10.h),
                    child: InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                          context: mcontext,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).colorScheme.secondary,
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 20,
                                ),
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
                                      color: const Color.fromARGB(
                                          255, 105, 105, 105),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(mainPadding.dg),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            context.pop();
                                            await mcontext
                                                .read<CarCareCompaniesCubit>()
                                                .search(
                                                  id: id,
                                                );
                                          },
                                          child: Text(
                                            'Reset'.tr(),
                                            style: TextStyles.text_14.copyWith(
                                                fontSize: 14.sp,
                                                color:
                                                    ColorApp.primeryColorDark,
                                                shadows: [
                                                  Shadow(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .color!,
                                                      blurRadius: 10)
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  verticalSpace(40.h),
                                  EmirateNameCountryFilter(
                                    emirates: emirates,
                                    selectedEmirate: selectedEmara,
                                    onSelected: (newEmara) async {
                                      selectedEmara = newEmara;
                                    },
                                  ),
                                  verticalSpace(40.h),
                                  Center(
                                    child: CustomButton(
                                      textStyle: TextStyles.text_18.copyWith(
                                          color: Colors.white, fontSize: 18.sp),
                                      color: ColorApp.primeryColorDark,
                                      text: 'Apply'.tr(),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        // await _applyFilters(mcontext);
                                        await mcontext
                                            .read<CarCareCompaniesCubit>()
                                            .search(
                                                id: id,
                                                location: selectedEmara);
                                      },
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 10),
                                    ),
                                  ),
                                  verticalSpace(40.h),
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
          ),
          const AdsCategoryContienr(),
          const Divider(
            height: 20,
            endIndent: 20,
            indent: 20,
          ),
          const CarCareCompaniesWidget(),
        ],
      ),
    );
  }
}

class CarCareCompaniesWidget extends StatelessWidget {
  const CarCareCompaniesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCareCompaniesCubit, CarCareCompaniesState>(
      builder: (context, state) {
        return state.when(
            initial: () => const SizedBox(),
            success: (companies) => CarouselSlider.builder(
                  itemCount: companies.length,
                  itemBuilder: (context, index, realIndex) => CompanyWidget(
                    name: companies[index].name,
                    endTime: companies[index].endTime,
                    startTime: companies[index].startTime,
                    location: companies[index].location,
                    locationIcon: Icons.location_on_outlined,
                    phoneNumber: companies[index].phoneNumber,
                    whatsAppNumber: companies[index].whatsAppNumber,
                    weekdays: companies[index].weekdayWork,
                    timeIcon: Icons.calendar_month_outlined,
                    companyImage: companies[index].companyImage,
                  ),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 10.5 / 9,
                  ),
                ),
            loading: () => CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    aspectRatio: 10.5 / 9,
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index, realIndex) =>
                      const CompanyLoadingList(),
                ),
            faliuer: () => Center(
                  child: Text(
                    'No Company'.tr(),
                    style: TextStyles.text_12,
                  ),
                ));
      },
    );
  }
}
