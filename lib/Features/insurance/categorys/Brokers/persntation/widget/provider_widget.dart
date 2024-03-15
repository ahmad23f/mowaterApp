import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/insurance/categorys/Brokers/models/insurance_providers_model.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';

class ServicesProviderWidget extends StatelessWidget {
  InsuranceProvidersModel provider;

  ServicesProviderWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: mainPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      height: 280.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: provider.image,
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
                      provider.name,
                      style: TextStyles.text_14.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                verticalSpace(6.dg),
                verticalSpace(6.dg),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded),
                    horizontalSpace(5.w),
                    Text(
                      provider.startTime ?? '',
                      style: TextStyles.text_12.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      " - ${provider.endTime}",
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
              callNumber: provider.phoneNumber.toString(),
              whatsAppNumber: provider.whatsAppNumber.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
