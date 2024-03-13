import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/widgets/loading/shimmer_widget.dart';

class RelatedProductLoadingList extends StatelessWidget {
  const RelatedProductLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.h,
          mainAxisSpacing: 10.w,
          childAspectRatio: 260.h / 400.w,
          crossAxisCount: 2,
        ),
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorApp.secunderyColorDark,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(98, 0, 0, 0),
                  spreadRadius: 0.0,
                  blurRadius: 10,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget(
                    width: mediasize(context).width.w,
                    height: mediasize(context).height * 0.2.h),
                Padding(
                  padding: EdgeInsets.all(8.0.dg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget(width: 50.w, height: 18.h),
                      verticalSpace(5.h),
                      Row(
                        children: [
                          ShimmerWidget(width: 50.w, height: 10),
                          horizontalSpace(5),
                          ShimmerWidget(width: 5.w, height: 2.h),
                          horizontalSpace(5),
                          ShimmerWidget(width: 50.w, height: 10)
                        ],
                      ),
                      verticalSpace(5.h),
                      Divider(
                        height: 3.h,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      verticalSpace(5.h),
                      Row(
                        children: [
                          ShimmerWidget(width: 60.w, height: 25),
                          horizontalSpace(5),
                          ShimmerWidget(width: 40.w, height: 20)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
