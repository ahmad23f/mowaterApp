import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cubit/CarBrands/car_brands_cubit.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/widgets/car_brands_widget.dart';
import 'package:Mowater/core/style/text_style.dart';

class CarAllBrandsScreen extends StatelessWidget {
  const CarAllBrandsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Car Brands".tr(),
          style: TextStyles.text_18,
        ),
      ),
      body: BlocBuilder<CarBrandsCubit, CarBrandsState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const SizedBox();
            },
            success: (carBrand) => GridView.builder(
              shrinkWrap: true,
              itemCount: carBrand.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) => InkWell(
                  child: CarBrandWidget(brand: carBrand[index], index: index)),
            ),
            faliure: (error) {
              return Column(
                children: [
                  Center(
                    child: Text("Ther is unkouwn error well fix it soon!".tr()),
                  )
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
