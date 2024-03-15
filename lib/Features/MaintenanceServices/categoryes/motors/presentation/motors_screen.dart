import 'package:Mowater/core/models/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/filter_icon.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/cubit/merchant_by_id_cubit.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/widgets/chip_chose.dart';
import 'package:Mowater/Features/MaintenanceServices/categoryes/motors/presentation/widgets/company_loading_widget.dart';
import 'package:Mowater/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
import 'package:Mowater/Features/MaintenanceServices/presentation/maintenanceAds/maintenance_ads_cubit.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:Mowater/Features/UsedSpareParts/presentation/widgets/filter_bootm_sheet_country.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/networking/api_constant.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/loading_trending.dart';
import 'package:Mowater/core/widgets/search_form_widget.dart';

// Add your import statements here...

class MaintenaceServicesMotorScreen extends StatefulWidget {
  final int specialtyId;
  final String categoryName;

  const MaintenaceServicesMotorScreen({
    Key? key,
    required this.specialtyId,
    required this.categoryName,
  }) : super(key: key);

  @override
  _MaintenaceServicesMotorScreenState createState() =>
      _MaintenaceServicesMotorScreenState();
}

class _MaintenaceServicesMotorScreenState
    extends State<MaintenaceServicesMotorScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController carNameController = TextEditingController();
  String query = '';

  String selectedEmirate = '';

  int selectedCarMake = 0;

  @override
  Widget build(BuildContext Mcontext) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: ModernSearchContainer(
              icon: Icons.abc,
              onChange: (p0) {
                query = p0;
                Mcontext.read<MerchantByIdCubit>().getMerchantById(
                  id: widget.specialtyId,
                  searchQuery: query,
                );
              },
              controller: textEditingController,
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
                                            width: 4,
                                            color: Color(0xff7d7d7d)))),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pop();
                                        await Mcontext.read<MerchantByIdCubit>()
                                            .getMerchantById(
                                                id: widget.specialtyId);
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
                                  carNameController: carNameController),
                              verticalSpace(40.h),
                              Center(
                                child: CustomButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 100.w, vertical: 10.h),
                                    onPressed: () async {
                                      context.pop();

                                      await _handleFilter(Mcontext);
                                    },
                                    color: ColorApp.primeryColorDark,
                                    textStyle: TextStyles.text_18
                                        .copyWith(color: Colors.white),
                                    text: 'Apply'),
                              )
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
              BlocBuilder<MaintenanceAdsCubit, MaintenanceAdsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(),
                    success: (data) => CarouselSlider.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index, realIndex) =>
                            TrendingWidget(image: data[index].image!),
                        options: CarouselOptions(viewportFraction: 1)),
                    failure: () => const Text("No Ads Yet!"),
                    loading: () => const LoadingTrendinglistView(),
                  );
                },
              ),
              BlocBuilder<MerchantByIdCubit, MerchantByIdState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Text('init'),
                    success: (companys) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: companys.length,
                      itemBuilder: (context, index) =>
                          CompanyMaintenanceCompanyWidget(
                        companyModel: companys[index],
                      ),
                    ),
                    loading: () => const CompanyLoadingList(),
                    failure: (message) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "There is No Company yet. Be The First One Now!",
                            style: TextStyles.text_14.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleFilter(BuildContext Mcontext) async {
    if (selectedCarMake == 0) {
      await Mcontext.read<MerchantByIdCubit>()
          .getMerchantById(id: widget.specialtyId, locaiton: selectedEmirate);
    } else if (selectedEmirate == '') {
      await Mcontext.read<MerchantByIdCubit>()
          .getMerchantById(id: widget.specialtyId, carMake: selectedCarMake);
    } else {
      await Mcontext.read<MerchantByIdCubit>().getMerchantById(
          id: widget.specialtyId,
          locaiton: selectedEmirate,
          carMake: selectedCarMake);
    }
  }
}

class CompanyMaintenanceCompanyWidget extends StatelessWidget {
  final UserModel companyModel;

  const CompanyMaintenanceCompanyWidget({Key? key, required this.companyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> day = companyModel.workDays!.split(',');
    return InkWell(
      onTap: () {
        context.push(RouteName.MaintenanceDetailsScreen, extra: companyModel);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 298,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiConstans.companyImage}${companyModel.image}" ?? '',
                fit: BoxFit.cover,
                width: mediasize(context).width,
                height: 160,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        companyModel.name ?? '',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            size: 20,
                            color: ColorApp.primeryColorDark,
                          ),
                          Text(
                            companyModel.location ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorApp.primeryColorDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.construction_sharp),
                      const SizedBox(width: 5),
                      Text(
                        toBeginningOfSentenceCase(
                              companyModel.type ?? '',
                            ) ??
                            '',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded),
                      const SizedBox(width: 5),
                      Text(
                        companyModel.startTime.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        " - ${companyModel.endTime}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ContactWhatsAndCall(
                callNumber: companyModel.phoneNumber ?? '',
                whatsAppNumber: companyModel.whatsAppNumber ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
