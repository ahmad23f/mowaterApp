import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/category.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/plateAds/plate_ads_cubit.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/error_ads_widget.dart';
import 'package:mowaterApp/core/widgets/loading_trending.dart';

class CarNumbersScreen extends StatelessWidget {
  const CarNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Numbers',
          style: TextStyles.text_18
              .copyWith(fontWeight: FontWeight.bold, fontSize: 19.sp),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<PlateAdsCubit, PlateAdsState>(
            builder: (context, state) {
              return state.when(
                  initial: () => const SizedBox.shrink(),
                  success: (ads) => CarouselSlider.builder(
                      itemCount: ads.length,
                      itemBuilder: (context, index, realIndex) =>
                          TrendingWidget(image: ads[index].image),
                      options: CarouselOptions(viewportFraction: 1)),
                  faliure: () => const ErrorAdsWidgte(),
                  loading: () => const LoadingTrendingWidget());
            },
          ),
          GridView.builder(
            itemCount: carNumberCateogry.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: mainPadding,
                crossAxisSpacing: mainPadding,
                crossAxisCount: crorAxixCount(context)),
            itemBuilder: (context, index) => InkWell(
                onTap: () =>
                    carNumberCateogry[index].categoryName == "Sell Your Plate"
                        ? context.push(RouteName.sellYourPlate)
                        : context.push(RouteName.platesForSaleScreen,
                            extra: carNumberCateogry[index]),
                child: carNumberCateogry[index]),
          )
        ],
      ),
    );
  }
}
