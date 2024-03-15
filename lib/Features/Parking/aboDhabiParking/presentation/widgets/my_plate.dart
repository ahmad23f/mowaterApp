import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/Parking/data/plateService/plate_service.dart';
import 'package:Mowater/Features/Parking/models/plate_model.dart';
import 'package:Mowater/Features/Parking/presentation/plate_screen.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class MyPlateListView extends StatelessWidget {
  dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  MyPlateListView({
    required this.onPageChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PlateService.getByLastUserAllPlates(),
      builder: (context, AsyncSnapshot<List<PlateModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Placeholder for loading state
        } else if (snapshot.hasError || snapshot.data == null) {
          return InkWell(
            onTap: () {
              context.push(RouteName.addPlate);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              width: 200.w,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 211, 211, 211),
              ),
              child: const Icon(
                Icons.add,
                size: 50,
              ),
            ),
          );
        } else {
          return Column(
            children: [
              Text(
                'My Cars',
                style: TextStyles.text_22,
              ),
              verticalSpace(20.h),
              CarouselSlider.builder(
                itemCount: snapshot.data!.length + 1,
                itemBuilder: (context, index, realIndex) {
                  if (index < snapshot.data!.length) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          child: MyPlateWidget(plate: snapshot.data![index]),
                        ),
                      ],
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        context.push(RouteName.addPlate);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 30.h),
                        width: 200.w,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 211, 211, 211),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                    );
                  }
                },
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 0.84,
                    aspectRatio: 70.w / 28.h,
                    onPageChanged: onPageChanged),
              ),
            ],
          );
        }
      },
    );
  }
}
