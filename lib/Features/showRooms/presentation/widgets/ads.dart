import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/Features/showRooms/data/ads/showRoomsAds/show_rooms_ads_cubit.dart';

class ShowroomsAds extends StatelessWidget {
  const ShowroomsAds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowRoomsAdsCubit, ShowRoomsAdsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          success: (ads) => CarouselSlider.builder(
              itemCount: ads.length,
              itemBuilder: (context, index, realIndex) =>
                  TrendingWidget(image: ads[index].image),
              options: CarouselOptions(viewportFraction: 1, autoPlay: true)),
          faliure: () {
            return Text('No Ads Yet!'.tr());
          },
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
