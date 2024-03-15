// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cubit/brandAdsCubit/brand_ads_cubit_cubit.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_image.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_price_and_premium.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/care_date_and_kilometers.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/care_model_and_name.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/contact_whats_and_call.dart';
import 'package:Mowater/Features/CarsForSale/presentation/cubits/cubit/related_car_cubit.dart';
import 'package:Mowater/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/di/dependency_injection.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';

class CarScreen extends StatefulWidget {
  final String name;

  const CarScreen({Key? key, required this.name}) : super(key: key);

  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final ScrollController _scrollController = ScrollController();
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppRegex.extractEnglishText(widget.name)} Cars'.tr(),
          style: TextStyles.text_22,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<BrandAdsCubitCubit, BrandAdsCubitState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                      return const SizedBox();
                    },
                    success: (data) {
                      return CarouselSlider.builder(
                          itemCount: data.length,
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                          ),
                          itemBuilder: (context, index, realIndex) =>
                              TrendingWidget(image: data[index].image));
                    },
                    faliure: (error) => Text(error),
                    loading: () => const CircularProgressIndicator.adaptive(),
                  );
                },
              ),
              Divider(
                height: 40.h,
                indent: 20,
                endIndent: 20,
              ),
              BlocProvider(
                create: (context) =>
                    getIt<RelatedCarCubit>()..getRealted('0', widget.name),
                child: BlocBuilder<RelatedCarCubit, RelatedCarState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      succss: (data) {
                        return ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: data.length + 1,
                          itemBuilder: (context, index) {
                            if (index < data.length) {
                              final car = data[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CarImageWidget(images: car.images),
                                      verticalSpace(mainPadding),
                                      Column(
                                        children: [
                                          CarPriceWithPremium(carModel: car),
                                          CarModelAndName(
                                            carModel: car.carMake.toString(),
                                            carName: widget.name,
                                          ),
                                          CarPrimeryDetails(carModel: car),
                                          verticalSpace(6),
                                          Divider(
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .color!,
                                            thickness: 2,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                        ],
                                      ),
                                      ContactWhatsAndCall(
                                        callNumber: car.callNumber.toString(),
                                        whatsAppNumber:
                                            car.whatsappNumber.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(),
                                ),
                              );
                            }
                          },
                        );
                      },
                      faliure: () => Text('error'.tr()),
                      loading: () => const CircularProgressIndicator.adaptive(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
