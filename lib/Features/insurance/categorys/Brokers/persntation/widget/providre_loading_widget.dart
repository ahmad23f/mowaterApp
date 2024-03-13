import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/widgets/company_loading_widget.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/widgets/loading/contact_widget.dart';
import 'package:mowaterApp/core/widgets/loading/shimmer_widget.dart';

class ProviderServiceLoadingListView extends StatelessWidget {
  const ProviderServiceLoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: ColorApp.secunderyColorDark,
            borderRadius: BorderRadius.circular(12)),
        height: 280.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ShimmerWidget(
                    width: mediasize(context).width, height: 160.h)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                verticalSpace(6.dg),
                Row(children: [
                  horizontalSpace(5.w),
                  ShimmerWidget(width: 80.w, height: 20.h),
                ]),
                verticalSpace(6.dg),
                Row(
                  children: [
                    IconLoading(
                      icon: Icons.access_time_rounded,
                    ),
                    horizontalSpace(5.w),
                    ShimmerWidget(width: 80.w, height: 20.h),
                    horizontalSpace(5),
                    ShimmerWidget(width: 5.w, height: 2.h),
                    horizontalSpace(5),
                    ShimmerWidget(width: 80.w, height: 20.h)
                  ],
                ),
              ]),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                ),
                child: const ContactLoadingRow())
          ],
        ),
      ),
    );
  }
}
