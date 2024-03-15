import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cars_details_screen.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/showRooms/models/show_room.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/networking/api_constant.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/google_map_widget.dart';

class ShowRoomDetailsScreen extends StatelessWidget {
  ShowroomModel shoowRoom;
  List<String> days = [];
  ShowRoomDetailsScreen({super.key, required this.shoowRoom});

  @override
  Widget build(BuildContext context) {
    days = shoowRoom.days.split(',');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          shoowRoom.name ?? '',
          style: TextStyles.text_14.copyWith(fontSize: 14.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 267.h,
            width: mediasize(context).width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "${ApiConstans.companyImage}${shoowRoom.showRommImage}",
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
                      shoowRoom.name ?? '',
                      style: TextStyles.text_18.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        shoowRoom.mowaterDiscount == 1
                            ? Container(
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
                                        'Mowater Discount'.tr(),
                                        style: TextStyles.text_12.copyWith(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    )
                  ],
                ),
                const Divider(),
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
                            children: [
                              Text(
                                "specialty: ".tr(),
                                style: TextStyles.text_12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      shoowRoom.specifications ?? '',
                      style: TextStyles.text_12,
                    ),
                  ],
                ),
                verticalSpace(mainPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Days:'.tr(),
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
                      'Hours:'.tr(),
                      style: TextStyles.text_14,
                    ),
                    Text(
                      '${shoowRoom.startTime} - ${shoowRoom.endTime}',
                      style: TextStyles.text_12,
                    )
                  ],
                ),
                verticalSpace(mainPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description :".tr(),
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
                          shoowRoom.location ?? '',
                          style: TextStyles.text_16.copyWith(
                            color: ColorApp.primeryColorDark,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                verticalSpace(12.h),
                Text(
                  shoowRoom.descreption ?? '',
                  style:
                      TextStyles.text_14.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            endIndent: 20,
            indent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Avilable Cars".tr(),
              style: TextStyles.text_18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          verticalSpace(mainPadding),
          shoowRoom.cars.isNotEmpty
              ? SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: shoowRoom.cars.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            context.push(RouteName.carDetailsScreen,
                                extra: shoowRoom.cars[index]);
                          },
                          child: SmallCarWidget(car: shoowRoom.cars[index]));
                    },
                  ),
                )
              : Text('No Cars Yet!'.tr()),
          const Divider(),
          GoogleMapWidgetComapny(
              latitude: shoowRoom.latitude!,
              longitude: shoowRoom.latitude!,
              id: shoowRoom.id)
        ]),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: ContactWhatsAndCall(
          callNumber: shoowRoom.callNumber.toString() ?? '',
          whatsAppNumber: shoowRoom.whatsAppNumber.toString() ?? '',
        ),
      ),
    );
  }
}
