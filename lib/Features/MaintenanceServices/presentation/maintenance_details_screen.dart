import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/model/companys/companyes_model.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/helper/reqexp.dart';
import 'package:mowaterApp/core/networking/api_constant.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/google_map_widget.dart';

class MaintenanceDetailsScreen extends StatelessWidget {
  MaintenanceCompanyModel maintenanceCompanyModel;
  List<String> days = [];
  MaintenanceDetailsScreen({super.key, required this.maintenanceCompanyModel});

  @override
  Widget build(BuildContext context) {
    days = maintenanceCompanyModel.weekdayWork!.split(',');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          maintenanceCompanyModel.name ?? '',
          style: TextStyles.text_14.copyWith(fontSize: 14.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 267.h,
            width: mediasize(context).width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "${ApiConstans.companyImage}${maintenanceCompanyModel.image}",
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(mainPadding.dg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      maintenanceCompanyModel.name ?? '',
                      style: TextStyles.text_18.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    maintenanceCompanyModel.mowaterDiscount == 1
                        ? Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorApp.primeryColorDark,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 30.h,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.discount_outlined,
                                        size: 20.dg,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'mowaterApp Discount',
                                        style: TextStyles.text_12.copyWith(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Container(
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          '!',
                          style: TextStyles.text_12,
                        ),
                      ),
                    ),
                    horizontalSpace(mainPadding),
                    Text(
                      'Details',
                      style: TextStyles.text_14,
                    )
                  ],
                ),
                verticalSpace(mainPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.warehouse_outlined,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "specialty:",
                          style: TextStyles.text_12,
                        ),
                      ),
                    ]),
                    InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                'Specialty Brands',
                                style: TextStyles.text_18
                                    .copyWith(color: ColorApp.primeryColorDark),
                              ),
                              content: SizedBox(
                                height: 300, // Adjust height as needed
                                child: CupertinoScrollbar(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: maintenanceCompanyModel
                                            .carBrands?.length ??
                                        0,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        // Close the dialog and pass back the selected item
                                        Navigator.of(context).pop();
                                      },
                                      child: CupertinoActionSheetAction(
                                        onPressed: () {},
                                        child: Text(
                                            AppRegex.extractEnglishText(
                                                maintenanceCompanyModel
                                                    .carBrands![index]),
                                            style: TextStyles.text_16
                                                .copyWith(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            'Tap To See More',
                            style: TextStyles.text_10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(colors: [
                                  ColorApp.primeryColorDark,
                                  ColorApp.secunderyColorDark
                                ])),
                            child: maintenanceCompanyModel.carBrands!.isEmpty
                                ? const Text('')
                                : Text(
                                    " ${maintenanceCompanyModel.carBrands?.first.split(',').first} ...",
                                    style: TextStyles.text_12,
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                verticalSpace(mainPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Days:',
                      style: TextStyles.text_14,
                    ),
                    Text(
                      '${days.first} - ${days.last}',
                      style: TextStyles.text_12,
                    )
                  ],
                ),
                verticalSpace(mainPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hours:',
                      style: TextStyles.text_14,
                    ),
                    Text(
                      '${maintenanceCompanyModel.startTime} - ${maintenanceCompanyModel.endTime}',
                      style: TextStyles.text_12,
                    )
                  ],
                ),
                verticalSpace(mainPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description :",
                      style: TextStyles.text_14,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.dg,
                          color: ColorApp.primeryColorDark,
                        ),
                        Text(
                          maintenanceCompanyModel.location ?? '',
                          style: TextStyles.text_16.copyWith(
                            color: ColorApp.primeryColorDark,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  maintenanceCompanyModel.description ?? '',
                  style:
                      TextStyles.text_14.copyWith(fontWeight: FontWeight.w500),
                ),
                const Divider(),
                Text(
                  'Map View :',
                  style: TextStyles.text_16,
                ),
                verticalSpace(mainPadding),
                GoogleMapWidgetComapny(
                    id: maintenanceCompanyModel.id ?? 1,
                    latitude: maintenanceCompanyModel.latitude ?? '',
                    longitude: maintenanceCompanyModel.longitude ?? ''),
                verticalSpace(mainPadding),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: ContactWhatsAndCall(
          callNumber: maintenanceCompanyModel.phoneNumber ?? '',
          whatsAppNumber: maintenanceCompanyModel.whatsappNumber ?? '',
        ),
      ),
    );
  }
}
