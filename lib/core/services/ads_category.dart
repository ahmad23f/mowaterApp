import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowaterApp/Features/carCare/presntation/ads/car_care_category_ads_cubit.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/core/widgets/error_ads_widget.dart';
import 'package:mowaterApp/core/widgets/loading_trending.dart';

class AdsCategoryContienr extends StatelessWidget {
  const AdsCategoryContienr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCareCategoryAdsCubit, CarCareCategoryAdsState>(
      builder: (context, state) {
        return state.when(
            initial: () => const SizedBox(),
            success: (ads) => CarouselSlider.builder(
                itemCount: ads.length,
                itemBuilder: (context, index, realIndex) =>
                    TrendingWidget(image: ads[index].image),
                options: CarouselOptions(viewportFraction: 1)),
            loading: () => CarouselSlider.builder(
                  options: CarouselOptions(viewportFraction: 1),
                  itemCount: 1,
                  itemBuilder: (context, index, realIndex) =>
                      const LoadingTrendingWidget(),
                ),
            faliure: () => const ErrorAdsWidgte());
      },
    );
  }
}
