import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/Features/insurance/presentation/MainAds/insurance_main_ads_cubit.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/category_widget.dart';
import 'package:mowaterApp/core/widgets/error_ads_widget.dart';
import 'package:mowaterApp/core/widgets/loading_trending.dart';

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Insurance",
          style: TextStyles.text_20,
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<InsurancAdsCubit, InsuranceMainAdsState>(
              builder: (context, state) {
            return state.when(
                initial: () => const SizedBox(),
                success: (ads) => CarouselSlider.builder(
                    itemCount: ads.length,
                    itemBuilder: (context, index, realIndex) =>
                        TrendingWidget(image: ads[index].image),
                    options: CarouselOptions(viewportFraction: 1)),
                loading: () => const LoadingTrendinglistView(),
                faliure: (error) => CarouselSlider.builder(
                    itemCount: 1,
                    itemBuilder: (context, index, realIndex) =>
                        const ErrorAdsWidgte(),
                    options: CarouselOptions(viewportFraction: 1)));
          }),
          Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: Column(
              children: [
                const Divider(),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: insuranceCategory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    crossAxisCount: crorAxixCount(context),
                    childAspectRatio: 100.w / 120.h,
                  ),
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        context.push(insuranceCategoryScreen[index],
                            extra: insuranceCategory[index].id);
                      },
                      child: insuranceCategory[index]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<CategoryWidget> insuranceCategory = [
  CategoryWidget(
      height: 80.h,
      id: 1,
      image: 'assets/insurance/brokers.png',
      categoryName: 'Borkers'),
  CategoryWidget(
      height: 80.h,
      id: 2,
      image: 'assets/insurance/company.png',
      categoryName: 'company'),
  CategoryWidget(
      height: 80.h,
      id: 3,
      image: 'assets/insurance/qoutes.png',
      categoryName: 'Request A Quate')
];

List<String> insuranceCategoryScreen = [
  RouteName.brokers,
  RouteName.companies,
  RouteName.requestAquate,
];
