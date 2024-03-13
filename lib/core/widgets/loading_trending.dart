import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/widgets/loading/shimmer_widget.dart';

class LoadingTrendinglistView extends StatelessWidget {
  const LoadingTrendinglistView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) => const LoadingTrendingWidget(),
      options: CarouselOptions(
        viewportFraction: 1,
      ),
    );
  }
}

class LoadingTrendingWidget extends StatelessWidget {
  const LoadingTrendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        child: ShimmerWidget(width: mediasize(context).width, height: 270.h));
  }
}
