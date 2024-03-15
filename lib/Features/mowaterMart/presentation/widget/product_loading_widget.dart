import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/widgets/loading/shimmer_widget.dart';

class LoadingProductWidget extends StatelessWidget {
  const LoadingProductWidget({
    Key? key,
    // Adjust the type if necessary
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 6.w,
          mainAxisSpacing: mainPadding.h,
          childAspectRatio: 250 / 400,
          crossAxisCount: 2,
        ),
        itemCount: 6, // Show a fixed number of shimmer items
        itemBuilder: (context, index) => Container(
              height: 270,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[300], // Shimmer color
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.secondary,
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
                        width: 200, height: mediasize(context).height * 0.2),
                    Padding(
                      padding: EdgeInsets.all(8.0.dg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ShimmerWidget(width: 50, height: 20),
                          verticalSpace(5.h),
                          ShimmerWidget(width: 100.w, height: 20),
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
                              const ShimmerWidget(width: 70, height: 20),
                              horizontalSpace(5.w),
                              const ShimmerWidget(width: 50, height: 20)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
