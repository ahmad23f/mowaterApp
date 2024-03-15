// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_name_dropdown.dart';
import 'package:Mowater/Features/fuel/models/fuel_model.dart';
import 'package:Mowater/Features/fuel/presentation/fuelPrice/fuel_price_cubit.dart';
import 'package:Mowater/Features/fuel/presentation/widgets/car_model.dart';
import 'package:Mowater/Features/fuel/presentation/widgets/fuel_price_continer.dart';
import 'package:Mowater/Features/fuel/presentation/widgets/fuel_price_for_car_mode.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/loading/shimmer_widget.dart';

class FuelScreen extends StatefulWidget {
  const FuelScreen({Key? key}) : super(key: key);

  @override
  State<FuelScreen> createState() => _FuelScreenState();
}

class _FuelScreenState extends State<FuelScreen> {
  TextEditingController carNameController = TextEditingController();

  String selectedCarModelPrice = 'select car To See Price';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.dg),
        child: BlocBuilder<FuelPriceCubit, FuelPriceState>(
          builder: (context, state) {
            return RefreshIndicator.adaptive(
              color: ColorApp.primeryColorDark,
              onRefresh: () async {
                await context.read<FuelPriceCubit>().update();
              },
              child: state.when(
                  initial: () => const SizedBox(),
                  success: (fuel) => FuelBody(fuel),
                  faliure: () => const Text("Check Your Internet!"),
                  loading: () => const FuelLoadingBody()),
            );
          },
        ),
      ),
    );
  }

  ListView FuelBody(FuelPriceModel fuel) {
    return ListView(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fuel Prices",
                    style: TextStyles.text_18.copyWith(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text(
                      "Last Update: ",
                      style: TextStyles.text_10,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd – HH:mm a').format(
                          fuel.lastUpdate?.add(const Duration(hours: 4)) ??
                              DateTime.now()),
                      style: TextStyles.text_10.copyWith(
                          color: ColorApp.primeryColorDark,
                          shadows: [const Shadow(blurRadius: 10)]),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        verticalSpace(12.h),
        Row(
          children: [
            FuelPriceTodayWidget(
                title: fuel.fuelPrices[0].fuelType,
                price: fuel.fuelPrices[0].price,
                color: fuelTypesColors[0]),
            FuelPriceTodayWidget(
                title: fuel.fuelPrices[1].fuelType,
                price: fuel.fuelPrices[1].price,
                color: fuelTypesColors[1]),
            FuelPriceTodayWidget(
                title: fuel.fuelPrices[2].fuelType,
                price: fuel.fuelPrices[2].price,
                color: fuelTypesColors[2]),
          ],
        ),
        Divider(
          height: 20,
          indent: 20.w,
          endIndent: 20.w,
        ),
        verticalSpace(12.h),
        CarNameDropDownWidget(
          carNameController: carNameController,
          onChanged: (p0) {
            selectedCarModelPrice = 'select car To See Price';
            setState(() {});
          },
        ),
        verticalSpace(20),
        CarModelFuelDropDown(
          onChanged: (value) {
            selectedCarModelPrice = value!;

            setState(() {});
          },
        ),
        verticalSpace(12.h),
        FuelPriceForCarModelWidget(
          price: selectedCarModelPrice,
          fuel: fuel.fuelPrices[0],
          color: fuelPriceForCarModelColors[0],
        ),
        FuelPriceForCarModelWidget(
          price: selectedCarModelPrice,
          fuel: fuel.fuelPrices[1],
          color: fuelPriceForCarModelColors[1],
        ),
        FuelPriceForCarModelWidget(
          price: selectedCarModelPrice,
          fuel: fuel.fuelPrices[2],
          color: fuelPriceForCarModelColors[2],
        )
      ],
    );
  }
}

class FuelLoadingBody extends StatelessWidget {
  const FuelLoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget(width: 120.w, height: 30.h),
                  verticalSpace(6.h),
                  ShimmerWidget(width: 200.w, height: 15.h),
                ],
              ),
            ],
          ),
          verticalSpace(12.h),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: ShimmerWidget(width: 200, height: 100.h)),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: ShimmerWidget(width: 200, height: 100.h)),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: ShimmerWidget(width: 200, height: 100.h)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: ShimmerWidget(width: mediasize(context).width, height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ShimmerWidget(width: mediasize(context).width, height: 60.h),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child:
                ShimmerWidget(width: mediasize(context).width, height: 120.h),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child:
                ShimmerWidget(width: mediasize(context).width, height: 120.h),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child:
                ShimmerWidget(width: mediasize(context).width, height: 120.h),
          ),
        ],
      ),
    );
  }
}

List<Color> fuelTypesColors = [
  const Color.fromARGB(
      255, 65, 146, 226), // Dodger Blue (Adjusted for dark mode)
  const Color.fromARGB(
      255, 104, 194, 104), // Lime Green (Adjusted for dark mode)
  const Color.fromARGB(255, 255, 99, 82), // Salmon (Adjusted for dark mode)
];

List<Color> fuelPriceForCarModelColors = [
  const Color.fromARGB(
      255, 65, 146, 226), // Dodger Blue (Adjusted for dark mode)
  const Color.fromARGB(
      255, 104, 194, 104), // Lime Green (Adjusted for dark mode)
  const Color.fromARGB(255, 255, 99, 82), // Salmon (Adjusted for dark mode)
];
