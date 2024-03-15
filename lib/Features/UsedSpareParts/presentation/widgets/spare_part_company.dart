import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/UsedSpareParts/models/spare_part_company.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';

class SparePartCompanyWidget extends StatelessWidget {
  final SpatepartsCompanyModel company;

  const SparePartCompanyWidget({Key? key, required this.company})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 298.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCompanyImage(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCompanyNameAndLocation(context),
                verticalSpace(6.dg),
                _buildCompanyDays(),
                verticalSpace(6.dg),
                _buildCompanyWorkingHours(),
              ],
            ),
          ),
          _buildContactInfo(context),
        ],
      ),
    );
  }

  Widget _buildCompanyImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: company.companyImage,
        fit: BoxFit.cover,
        width: mediasize(context).width,
        height: 160.h,
      ),
    );
  }

  Widget _buildCompanyNameAndLocation(BuildContext context) {
    return Row(
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
    );
  }

  Widget _buildCompanyDays() {
    return Row(
      children: [
        Icon(
          Icons.maps_home_work_outlined,
          size: 20.dg,
        ),
        horizontalSpace(5.w),
        Row(
          children: [
            Text(
              company.daysWeek.first,
              style: TextStyles.text_12,
            ),
            Text(
              " - ${company.daysWeek.last}",
              style: TextStyles.text_12,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCompanyWorkingHours() {
    return Row(
      children: [
        const Icon(Icons.access_time_rounded),
        horizontalSpace(5.w),
        Text(
          company.startTime ?? '',
          style: TextStyles.text_12.copyWith(fontSize: 14.sp),
        ),
        Text(
          " - ${company.endTime}",
          style: TextStyles.text_12.copyWith(fontSize: 14.sp),
        )
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: ContactWhatsAndCall(
        callNumber: company.phoneNumber.toString(),
        whatsAppNumber: company.whatsAppNumber.toString(),
      ),
    );
  }
}
