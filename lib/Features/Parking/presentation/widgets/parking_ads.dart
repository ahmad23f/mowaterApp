import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mowater/Features/Parking/presentation/parkingAds/parking_ads_cubit.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';

class ParkingAds extends StatelessWidget {
  const ParkingAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParkingAdsCubit, ParkingAdsState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox(
              child: Text('s'),
            );
          },
          success: (ads) => SizedBox(
            child: CarouselSlider.builder(
                options: CarouselOptions(viewportFraction: 1),
                itemCount: ads.length,
                itemBuilder: (context, index, realIndex) =>
                    TrendingWidget(image: ads[index].image)),
          ),
          faliure: (error) => const Text("No Ads!"),
          loading: () => const CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
