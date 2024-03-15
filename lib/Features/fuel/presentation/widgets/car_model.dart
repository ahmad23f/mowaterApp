import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cubit/carModelsBrand/car_models_brands_cubit.dart';
import 'package:Mowater/Features/SellYourCar/presentation/widgets/formWidget/car_model_dropdown.dart';
import 'package:Mowater/core/helper/reqexp.dart';

class CarModelFuelDropDown extends StatefulWidget {
  void Function(String?)? onChanged;

  CarModelFuelDropDown({super.key, this.onChanged});

  @override
  State<CarModelFuelDropDown> createState() => _CarModelFuelDropDownState();
}

class _CarModelFuelDropDownState extends State<CarModelFuelDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarModelsBrandsCubit, CarModelsBrandsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          success: (data) => DropdownButtonFormField<String>(
            isExpanded: false,
            decoration: FormDecorationCarSell(),
            onChanged: (value) {
              // Do something with the selected car model
            },
            value: null,
            items: data.map<DropdownMenuItem<String>>((model) {
              return DropdownMenuItem<String>(
                onTap: () {
                  widget.onChanged?.call(model.fuelTank);
                },
                value: model.name,
                child: Text(AppRegex.extractEnglishText(model.name)),
              );
            }).toList(),
          ),
          faliure: () {
            return const Text("No Moudles Found");
          },
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}
