import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/UsedSpareParts/presentation/ads/used_spare_parts_ads_cubit.dart';
import 'package:Mowater/Features/UsedSpareParts/presentation/widgets/categorys_grid_view.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/error_ads_widget.dart';
import 'package:Mowater/core/widgets/loading_trending.dart';

class UsedSparePartsScreen extends StatelessWidget {
  UsedSparePartsScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spare Parts'.tr(), style: TextStyles.text_22),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<UsedSparePartsAdsCubit, UsedSparePartsAdsState>(
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
            ),
            verticalSpace(10.h),
            Divider(
              height: 20.h,
            ),
            const Padding(
              padding: EdgeInsets.all(mainPadding),
              child: UsedSparePartsCategorysGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
