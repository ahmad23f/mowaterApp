import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/Features/rentalCars/presentation/cubtis/cubit/rental_cars_ads_cubit.dart';

class RentalCarsAds extends StatelessWidget {
  const RentalCarsAds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RentalCarsAdsCubit, RentalCarsAdsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          success: (ads) => SizedBox(
            height: 270.h,
            child: CarouselSlider.builder(
                itemCount: ads.length,
                itemBuilder: (context, index, realIndex) =>
                    TrendingWidget(image: ads[index].image),
                options: CarouselOptions(viewportFraction: 1)),
          ),
          loading: () => const CircularProgressIndicator.adaptive(),
          faliure: () => const Center(child: Text("There is No Ads Yet!")),
        );
      },
    );
  }
}
