import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/Parking/data/image_principality.dart';
import 'package:Mowater/Features/carNumbers/models/plate_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/get_post_when.dart';
import 'package:Mowater/core/style/text_style.dart';

class PlateForSaleWidget extends StatelessWidget {
  final PlateModelForSale plate;

  const PlateForSaleWidget({Key? key, required this.plate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const ClampingScrollPhysics(), // Disable scrolling for the ListView
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 33, 33, 33),
                spreadRadius: 0.1,
                blurRadius: 20,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          height: 270.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(20.dg),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        plate.code,
                        style: TextStyles.text_28.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        height: 50.h,
                        width: 90.h,
                        itemImages[plate.source]!,
                      ),
                      const SizedBox(),
                      Text(
                        plate.plateNumber,
                        style: TextStyles.text_28.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              plate.price,
                              style:
                                  TextStyles.text_18.copyWith(fontSize: 22.sp),
                            ),
                            Text(
                              'AED'.tr(),
                              style: TextStyles.text_14.copyWith(
                                  color: ColorApp.primeryColorDark,
                                  fontSize: 14.sp),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              calculateTimeDifference(
                                plate.postAt.toString(),
                              ),
                              style: TextStyles.text_12,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.date_range_outlined,
                                size: 20.dg,
                                color: ColorApp.primeryColorDark,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    verticalSpace(6.dg),
                    verticalSpace(6.dg),
                    Row(
                      children: [
                        const Icon(Icons.numbers),
                        horizontalSpace(5.w),
                        Text(
                          '${plate.code}  ${getPlateSourceCode(plate.source)} ${plate.plateNumber}',
                          style: TextStyles.text_12.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                ),
                child: ContactWhatsAndCall(
                  callNumber: plate.phoneNmber.toString(),
                  whatsAppNumber: plate.whatsApp.toString(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
