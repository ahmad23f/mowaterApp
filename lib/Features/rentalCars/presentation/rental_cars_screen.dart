import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/cubtis/rentalCarsCompany/rental_cars_companys_cubit.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/widgets/ads.dart';
import 'package:mowaterApp/Features/rentalCars/presentation/widgets/company.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class RentalCarsScreen extends StatelessWidget {
  const RentalCarsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rental Cars",
          style: TextStyles.text_22,
        ),
      ),
      body: Column(
        children: [
          const RentalCarsAds(),
          BlocBuilder<RentalCarsCompanysCubit, RentalCarsCompanysState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                success: (companys) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: companys.length,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          context.push(
                            RouteName.rentalCarCompanyDetials,
                            extra: companys[index],
                          );
                        },
                        child:
                            RentalCarCompanyWidget(company: companys[index]))),
                faliure: () => Center(
                  child: Text(
                    "There is No Company Yet!",
                    style: TextStyles.text_24,
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
