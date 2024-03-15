import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    Key? key,
    this.companyImage,
    this.name,
    this.startTime,
    this.endTime,
    this.phoneNumber,
    this.whatsAppNumber,
    this.weekdays,
    this.createAccountAt,
    this.location,
    this.mowaterDiscount,
    this.locationIcon,
    this.timeIcon,
    this.phoneIcon,
    this.whatsappIcon,
  }) : super(key: key);

  final String? companyImage;
  final String? name;
  final String? startTime;
  final String? endTime;
  final String? phoneNumber;
  final String? whatsAppNumber;
  final List<String>? weekdays;
  final String? createAccountAt;
  final String? location;
  final int? mowaterDiscount;
  final IconData? locationIcon;
  final IconData? timeIcon;
  final IconData? phoneIcon;
  final IconData? whatsappIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle onTap event
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 310.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            companyImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: companyImage!,
                      fit: BoxFit.cover,
                      width: mediasize(context).width,
                      height: 160,
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name ?? '',
                          style: TextStyles.text_16
                              .copyWith(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          locationIcon != null
                              ? Icon(
                                  locationIcon,
                                  size: 20,
                                  color: ColorApp.primeryColorDark,
                                )
                              : const SizedBox.shrink(),
                          Text(location ?? '',
                              style: TextStyles.text_14.copyWith(
                                  fontSize: 14.sp,
                                  color: ColorApp.primeryColorDark,
                                  shadows: [
                                    Shadow(
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .color!,
                                        blurRadius: 10)
                                  ])),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      timeIcon != null
                          ? Icon(
                              timeIcon,
                              size: 20.dg,
                              color: ColorApp.primeryColorDark,
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(width: 5),
                      Text('${startTime ?? ''} - ${endTime ?? ''}',
                          style: TextStyles.text_12),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  weekdays != null
                      ? Row(
                          children: [
                            Icon(
                              Icons.home_work_outlined,
                              size: 20.dg,
                              color: ColorApp.primeryColorDark,
                            ),
                            horizontalSpace(8.w),
                            Row(
                              children: [
                                Text(
                                  weekdays!.first,
                                  style: TextStyles.text_12,
                                ),
                                Text(
                                  " - ${weekdays!.last}",
                                  style: TextStyles.text_12,
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ContactWhatsAndCall(
                callNumber: phoneNumber ?? '',
                whatsAppNumber: whatsAppNumber ?? '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
