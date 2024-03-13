import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/filter_icon.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/widgets/chip_chose.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/widgets/company_loading_widget.dart';
import 'package:mowaterApp/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:mowaterApp/Features/UsedSpareParts/presentation/widgets/filter_bootm_sheet_country.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/Features/inspection/presntation/ads/inspection_ads_cubit.dart';
import 'package:mowaterApp/Features/inspection/presntation/company/inspection_companye_cubit.dart';
import 'package:mowaterApp/Features/inspection/presntation/widgets/company_widget.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';
import 'package:mowaterApp/core/widgets/error_ads_widget.dart';
import 'package:mowaterApp/core/widgets/loading_trending.dart';
import 'package:mowaterApp/core/widgets/search_form_widget.dart';

class InspetionScreen extends StatelessWidget {
  InspetionScreen({super.key});
  TextEditingController serachController = TextEditingController();
  TextEditingController carMakeController = TextEditingController();
  int selectedCarMake = 0;
  String selectedEmirate = 'dubai';
  int mowaterDiscount = 0;
  @override
  Widget build(BuildContext Mcontext) {
    return Scaffold(
      appBar: AppBar(
        title: ModernSearchContainer(
            icon: Icons.abc,
            onChange: (p0) {
              Mcontext.read<InspectionCompanyeCubit>().getCompany(
                name: p0,
              );
            },
            controller: serachController,
            hintText: 'Search',
            widget: FilterIcon(onPressed: () async {
              return await showModalBottomSheet(
                  context: Mcontext,
                  builder: (context) {
                    return SizedBox(
                      height: 450,
                      width: mediasize(context).width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 100.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: const Border(
                                      bottom: BorderSide(
                                          width: 4, color: Color(0xff7d7d7d)))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pop();
                                      await Mcontext.read<
                                              InspectionCompanyeCubit>()
                                          .getCompany();
                                    },
                                    child: Text(
                                      "Reset",
                                      style: TextStyles.text_16.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: ColorApp.primeryColorDark),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(20.h),
                            EmirateNameCountryFilter(
                              emirates: emirates,
                              selectedEmirate: selectedEmirate,
                              onSelected: (p0) {
                                selectedEmirate = p0;
                              },
                            ),
                            verticalSpace(40.h),
                            Text(
                              'Car Make',
                              style: TextStyles.text_16
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            verticalSpace(20.h),
                            CarNameDropDownWidget(
                                onChanged: (p0) {
                                  selectedCarMake = p0!;
                                },
                                carNameController: carMakeController),
                            MowaterDiscountCheckBox(
                                onChanged: (p0) {
                                  mowaterDiscount = p0 == true ? 1 : 0;
                                  print(mowaterDiscount);
                                },
                                selectedType: mowaterDiscount ?? 0),
                            verticalSpace(40.h),
                            Center(
                              child: CustomButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 100.w, vertical: 10.h),
                                  onPressed: () async {
                                    context.pop();

                                    await _handleFilter(Mcontext);
                                    print(mowaterDiscount);
                                  },
                                  color: ColorApp.primeryColorDark,
                                  textStyle: TextStyles.text_18
                                      .copyWith(color: Colors.white),
                                  text: 'Apply'),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            })),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<InspectionAdsCubit, InspectionAdsState>(
              builder: (context, state) {
                return state.when(
                    initial: () => const SizedBox(),
                    success: (data) => CarouselSlider.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index, realIndex) =>
                              TrendingWidget(
                            image: data[index].image,
                          ),
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                          ),
                        ),
                    faliure: () => const ErrorAdsWidgte(),
                    loading: () => const LoadingTrendinglistView());
              },
            ),
            Divider(
              height: 20.h,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child:
                  BlocBuilder<InspectionCompanyeCubit, InspectionCompanyeState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => const SizedBox(
                            child: Text('data'),
                          ),
                      success: (data) => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (
                              context,
                              index,
                            ) =>
                                InspectionCompanyWidget(
                                    companyModel: data[index]),
                          ),
                      faliure: () =>
                          const Center(child: Text('There Is No Company !')),
                      loading: () => const CompanyLoadingList());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleFilter(BuildContext Mcontext) async {
    if (selectedCarMake == 0) {
      await Mcontext.read<InspectionCompanyeCubit>().getCompany(
          location: selectedEmirate, mowaterDiscount: mowaterDiscount);
    } else if (selectedEmirate == '') {
      await Mcontext.read<InspectionCompanyeCubit>().getCompany(
          specialty: selectedCarMake, mowaterDiscount: mowaterDiscount);
    } else {
      await Mcontext.read<InspectionCompanyeCubit>().getCompany(
          location: selectedEmirate,
          specialty: selectedCarMake,
          mowaterDiscount: mowaterDiscount);
    }
  }
}

class MowaterDiscountCheckBox extends StatefulWidget {
  void Function(bool?)? onChanged;

  int selectedType;
  MowaterDiscountCheckBox(
      {super.key, required this.selectedType, this.onChanged});

  @override
  State<MowaterDiscountCheckBox> createState() =>
      _MowaterDiscountCheckBoxState();
}

class _MowaterDiscountCheckBoxState extends State<MowaterDiscountCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: ColorApp.primeryColorDark,
          checkColor: Colors.white,
          value: widget.selectedType == 1 ? true : false,
          onChanged: (value) {
            setState(() {
              widget.selectedType = value == true ? 1 : 0;
            });
            widget.onChanged!.call(value);
          },
        ),
        const Text(
          'mowaterApp Discount',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
