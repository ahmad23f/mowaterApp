import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/rentalCars/models/company_rental_car.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';

class RentalCarCompanyWidget extends StatelessWidget {
  CompanyRentalCarsModel company;
  List<String> days = [];

  RentalCarCompanyWidget({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    days = company.daysWeek.split(',');
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      height: 298.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: company.companyImage,
              fit: BoxFit.cover,
              width: mediasize(context).width,
              height: 160.h,
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
                      company.name,
                      style: TextStyles.text_14.copyWith(fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          size: 20.dg,
                          color: ColorApp.primeryColorDark,
                        ),
                        Text(
                          company.location,
                          style: TextStyles.text_14.copyWith(
                            fontSize: 14.sp,
                            color: ColorApp.primeryColorDark,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                verticalSpace(6.dg),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.maps_home_work_outlined,
                          size: 20.dg,
                        ),
                        horizontalSpace(5.w),
                        Row(
                          children: [
                            Text(
                              days.first,
                              style: TextStyles.text_12,
                            ),
                            Text(
                              " - ${days.last}",
                              style: TextStyles.text_12,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                verticalSpace(6.dg),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded),
                    horizontalSpace(5.w),
                    Text(
                      company.startTime ?? '',
                      style: TextStyles.text_12.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      " - ${company.endTime}",
                      style: TextStyles.text_12.copyWith(
                        fontSize: 14.sp,
                      ),
                    )
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
              callNumber: company.phoneNumber.toString(),
              whatsAppNumber: company.whatsApp.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
