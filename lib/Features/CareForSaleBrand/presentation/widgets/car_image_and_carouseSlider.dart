import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CarsForSale/data/model/carModelProduct/car_image_model.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/networking/api_constant.dart';

class CarImageCarouselSlider extends StatefulWidget {
  const CarImageCarouselSlider({
    Key? key,
    required this.car,
  }) : super(key: key);

  final List<CarImage> car;

  @override
  State<CarImageCarouselSlider> createState() => _CarImageCarouselSliderState();
}

class _CarImageCarouselSliderState extends State<CarImageCarouselSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemCount: widget.car.length,
          itemBuilder: (context, index, realIndex) {
            final image = widget.car[index];
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: mediasize(context).width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            ApiConstans.imageCars + image.imageName),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: mediasize(context).height * 0.1.h,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        // Positioned(
        //   bottom: 10.dg,
        //   left: 0,
        //   right: 0,
        //   child: DotsIndicator(
        //     dotsCount: widget.images.length,
        //     position: currentIndex,
        //     decorator: DotsDecorator(
        //       color: Colors.grey[300]!,
        //       activeColor: Colors.white,
        //       activeShape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(11.dg),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
