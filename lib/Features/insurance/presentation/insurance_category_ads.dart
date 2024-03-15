import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/Features/insurance/presentation/MainAds/insurance_main_ads_cubit.dart';
import 'package:Mowater/core/widgets/error_ads_widget.dart';
import 'package:Mowater/core/widgets/loading_trending.dart';

class InsuranceCategoryAdsWidget extends StatelessWidget {
  const InsuranceCategoryAdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsurancAdsCubit, InsuranceMainAdsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          success: (ads) {
            return CarouselSlider.builder(
                itemCount: ads.length,
                itemBuilder: (context, index, realIndex) =>
                    TrendingWidget(image: ads[index].image),
                options: CarouselOptions(viewportFraction: 1));
          },
          loading: () => const LoadingTrendinglistView(),
          faliure: (error) => const ErrorAdsWidgte(),
        );
      },
    );
  }
}
