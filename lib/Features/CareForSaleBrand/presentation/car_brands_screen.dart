import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/cubit/CarBrands/car_brands_cubit.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/car_brands_widget.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class CarAllBrandsScreen extends StatelessWidget {
  const CarAllBrandsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Car Brands",
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
              return const Column(
                children: [
                  Center(
                    child: Text("Ther is unkouwn error well fix it soon!"),
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
