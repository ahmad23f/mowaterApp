import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/widgets/loading/contact_widget.dart';
import 'package:Mowater/core/widgets/loading/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class CompanyLoadingList extends StatelessWidget {
  const CompanyLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        height: 310.h,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(width: 80.w, height: 20.h),
                    Row(
                      children: [
                        IconLoading(icon: Icons.location_on_sharp),
                        ShimmerWidget(width: 60.w, height: 20.h),
                      ],
                    )
                  ],
                ),
                verticalSpace(6.dg),
                Row(children: [
                  IconLoading(icon: Icons.construction_sharp),
                  horizontalSpace(5.w),
                  ShimmerWidget(width: 80.w, height: 20.h),
                ]),
                verticalSpace(6.dg),
                Row(
                  children: [
                    IconLoading(icon: Icons.access_time_rounded),
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

class IconLoading extends StatelessWidget {
  IconData icon;
  IconLoading({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 72, 72, 72),
        highlightColor: const Color.fromARGB(255, 66, 66, 66),
        child: Icon(
          icon,
          size: 25.dg,
          color: ColorApp.primeryColorDark,
        ));
  }
}
