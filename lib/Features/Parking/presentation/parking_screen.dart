import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/Parking/data/parking_countery.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/core/constants/categorys_image.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Parking",
          style: TextStyles.text_22.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
              itemCount: 2,
              itemBuilder: (context, index, realIndex) => TrendingWidget(
                  image:
                      'https://d2hucwwplm5rxi.cloudfront.net/wp-content/uploads/2021/05/03110754/Mawaqif-_-Cover-3-8-23.jpg'),
              options: CarouselOptions(autoPlay: true, viewportFraction: 1)),
          const Divider(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: GridView.builder(
                itemCount: barkingCountery.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: mainPadding,
                    mainAxisSpacing: mainPadding,
                    childAspectRatio: 120.h / 90.w,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const []),
                      child: InkWell(
                        onTap: () {
                          context.push(
                            RouteName.parkingForm,
                            extra: barkingCountery[index],
                          );
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: 175.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Divider(
                                      color: Colors.white,
                                      indent: 20,
                                      endIndent: 20,
                                      thickness: 0.5,
                                    ),
                                    Text(
                                      barkingCountery[index].name,
                                      style: TextStyles.text_22.copyWith(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Image.asset(
                              CategoryesImageName.parking,
                              width: mediasize(context).width,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    )),
          ))
        ],
      ),
    );
  }
}
