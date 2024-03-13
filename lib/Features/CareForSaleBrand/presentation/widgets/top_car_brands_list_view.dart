import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/Features/CareForSaleBrand/presentation/widgets/car_brands_widget.dart';

import '../cubit/CarBrands/car_brands_cubit.dart';

class TopCarBrandsListview extends StatelessWidget {
  const TopCarBrandsListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarBrandsCubit, CarBrandsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Text('in'),
          success: (carsBrands) {
            return SizedBox(
              height: 110.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CarBrandWidget(
                    index: index,
                    brand: carsBrands[index],
                  );
                },
              ),
            );
          },
          faliure: (error) {
            return Text(error);
          },
          loading: () => const CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
