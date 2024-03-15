import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/inspection/models/inspection_company_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/google_map_widget.dart';

class InspectionCompanyDetailsScreen extends StatelessWidget {
  InspectionCompanyModel company;
  InspectionCompanyDetailsScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          company.name ?? '',
          style: TextStyles.text_14.copyWith(fontSize: 14.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 267.h,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  company.companyImage ?? '',
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
                      company.name ?? '',
                      style: TextStyles.text_18.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    company.mowaterDiscount == 1
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
                                        'Mowater Discount',
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
                    Row(
                      children: [
                        const Icon(
                          Icons.warehouse_outlined,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "specialty:",
                                style: TextStyles.text_12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                                    itemCount: company.brandNames.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        // Close the dialog and pass back the selected item
                                        Navigator.of(context)
                                            .pop(company.brandNames[index]);
                                      },
                                      child: CupertinoActionSheetAction(
                                        onPressed: () {},
                                        child: Text(
                                            AppRegex.extractEnglishText(
                                                company.brandNames[index]),
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
                                  Theme.of(context).colorScheme.secondary
                                ])),
                            child: company.brandNames.length > 1
                                ? Text(
                                    " ${company.brandNames.first} ...",
                                    style: TextStyles.text_12,
                                  )
                                : const Text('no specialtys'),
                          ),
                        ],
                      ),
                    ),
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
                      '${company.weekdayWork.first} - ${company.weekdayWork.length}',
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
                      '${company.startTime} - ${company.endTime}',
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
                          company.location ?? '',
                          style: TextStyles.text_16.copyWith(
                            color: ColorApp.primeryColorDark,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  company.description ?? '',
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
                    id: company.id,
                    latitude: company.latitude ?? '',
                    longitude: company.longitude ?? ''),
                verticalSpace(mainPadding),
                ContactWhatsAndCall(
                  callNumber: company.phoneNumber ?? '',
                  whatsAppNumber: company.whatsAppNumber ?? '',
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
