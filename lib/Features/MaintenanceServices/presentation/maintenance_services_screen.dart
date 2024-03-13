import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/MaintenanceServices/categoryes/motors/presentation/cubit/merchant_by_id_cubit.dart';
import 'package:mowaterApp/Features/MaintenanceServices/data/repositeory/localData/maintenace_services_categores.dart';
import 'package:mowaterApp/Features/MaintenanceServices/presentation/trending_serveic/trending_service_cubit.dart';
import 'package:mowaterApp/Features/home/presentation/widgets/trending/trending_widget.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/di/dependency_injection.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/error_ads_widget.dart';
import 'package:mowaterApp/core/widgets/loading_trending.dart';

class MaintenanceServicesScreen extends StatefulWidget {
  MaintenanceServicesScreen({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();
  @override
  State<MaintenanceServicesScreen> createState() =>
      _MaintenanceServicesScreenState();
}

class _MaintenanceServicesScreenState extends State<MaintenanceServicesScreen> {
  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        print('object');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maintenance Services",
          style: TextStyles.text_22.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<TrendingServiceCubit, TrendingServiceState>(
            builder: (context, state) {
              return state.when(
                  initial: () => const SizedBox(),
                  success: (data) => CarouselSlider.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index, realIndex) =>
                            TrendingWidget(
                          image: data[index].image,
                        ),
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
                      ),
                  failure: (error) => const ErrorAdsWidgte(),
                  loading: () => const LoadingTrendinglistView());
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                children: [
                  verticalSpace(mainPadding),
                  const Divider(),
                  Expanded(
                    child: GridView.builder(
                      controller: widget.scrollController,
                      shrinkWrap: true,
                      itemCount: maintenaceServicesCategoryes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: mainPadding,
                        crossAxisSpacing: mainPadding,
                        crossAxisCount: crorAxixCount(context),
                      ),
                      itemBuilder: (context, index) => BlocProvider(
                        create: (context) => getIt<MerchantByIdCubit>()
                          ..getMerchantById(
                            id: maintenaceServicesCategoryes[index].id,
                          ),
                        child: InkWell(
                          onTap: () {
                            context.push(RouteName.maintenaceServicesMotor,
                                extra: {
                                  'id': index + 1,
                                  "name": maintenaceServicesCategoryes[index]
                                      .categoryName
                                });
                          },
                          child: maintenaceServicesCategoryes[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
