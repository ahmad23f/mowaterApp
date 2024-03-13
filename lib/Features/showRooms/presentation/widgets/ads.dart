import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/Features/showRooms/data/ads/showRoomsAds/show_rooms_ads_cubit.dart';

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
            return const Text('No Ads Yet!');
          },
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
