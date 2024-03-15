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
import 'package:Mowater/Features/inspection/presntation/inspection_screen.dart';
import 'package:Mowater/Features/warranty/presntation/cubit/warranty_companies_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/services/ads_widget.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/company_widget.dart';
import 'package:Mowater/core/widgets/search_form_widget.dart';

class WarrantyScreen extends StatelessWidget {
  WarrantyScreen({super.key});

  TextEditingController searchController = TextEditingController();
  String selectedEmirates = 'dubai'.tr();
  int? mowaterDiscount;
  @override
  Widget build(BuildContext mcontext) {
    return BlocBuilder<WarrantyCompaniesCubit, WarrantyCompaniesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Warranty'.tr(),
              style: TextStyles.text_14,
            ),
            actions: [
              SizedBox(
                height: 60,
                width: 200.w,
                child: ModernSearchContainer(
                  controller: searchController,
                  hintText: 'Search'.tr(),
                  onChange: (p0) {
                    context.read<WarrantyCompaniesCubit>().filter(search: p0);
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
                                      color: const Color.fromARGB(
                                          255, 105, 105, 105),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(mainPadding),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                context.pop();
                                                mcontext
                                                    .read<
                                                        WarrantyCompaniesCubit>()
                                                    .filter();
                                              },
                                              child: Text(
                                                "Reset".tr(),
                                                style: TextStyles.text_16
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColorApp
                                                            .primeryColorDark),
                                              ),
                                            ),
                                          ],
                                        ),
                                        verticalSpace(10.h),
                                        verticalSpace(40.h),
                                        EmirateNameCountryFilter(
                                          emirates: emirates,
                                          selectedEmirate: selectedEmirates,
                                          onSelected: (newEmara) async {
                                            selectedEmirates = newEmara;
                                          },
                                        ),
                                        verticalSpace(40.h),
                                        MowaterDiscountCheckBox(
                                            onChanged: (p0) {
                                              mowaterDiscount =
                                                  p0 == true ? 1 : 0;
                                              print(mowaterDiscount);
                                            },
                                            selectedType: mowaterDiscount ?? 0),
                                        verticalSpace(40.h),
                                        Center(
                                          child: CustomButton(
                                            textStyle: TextStyles.text_18
                                                .copyWith(color: Colors.white),
                                            color: ColorApp.primeryColorDark,
                                            text: 'Apply'.tr(),
                                            onPressed: () async {
                                              context.pop();
                                              mcontext
                                                  .read<
                                                      WarrantyCompaniesCubit>()
                                                  .filter(
                                                      location:
                                                          selectedEmirates,
                                                      discountMowater:
                                                          mowaterDiscount);
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
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AdsContienr(),
                Divider(
                  height: 20.h,
                  endIndent: 20,
                  indent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                  child: state.when(
                    initial: () => const SizedBox(),
                    success: (company) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: company.length,
                      itemBuilder: (context, index) => CompanyWidget(
                        companyImage: company[index].companyImage,
                        endTime: company[index].endTime,
                        location: company[index].location,
                        locationIcon: Icons.location_on_outlined,
                        mowaterDiscount: company[index].mowaterDiscount,
                        startTime: company[index].startTime,
                        weekdays: company[index].weekdays,
                        name: company[index].name,
                        whatsAppNumber: company[index].whatsAppNumber,
                        phoneNumber: company[index].phoneNumber,
                        timeIcon: Icons.calendar_month_outlined,
                      ),
                    ),
                    loading: () => CarouselSlider.builder(
                      options: CarouselOptions(
                          viewportFraction: 1, aspectRatio: 12 / 16),
                      itemCount: 1,
                      itemBuilder: (context, index, realIndex) =>
                          const CompanyLoadingList(),
                    ),
                    faliure: () => Text(
                      'No Companies'.tr(),
                      style: TextStyles.text_18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
