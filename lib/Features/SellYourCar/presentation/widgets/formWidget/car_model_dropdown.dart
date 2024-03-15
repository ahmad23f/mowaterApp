import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cubit/carModelsBrand/car_models_brands_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';

class CarModelDropDown extends StatefulWidget {
  void Function(int?)? onChanged;

  CarModelDropDown({super.key, this.onChanged});

  @override
  State<CarModelDropDown> createState() => _CarModelDropDownState();
}

class _CarModelDropDownState extends State<CarModelDropDown> {
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
                  widget.onChanged?.call(model.id);
                },
                value: model.name,
                child: Text(AppRegex.extractEnglishText(model.name)),
              );
            }).toList(),
          ),
          faliure: () {
            return const Text("No Moudles Found");
          },
          loading: () => const CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}

InputDecoration FormDecorationCarSell() {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorApp.primeryColorDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorApp.primeryColorDark),
    ),
    prefixIcon: const Icon(Icons.commute_sharp),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: TextStyles.text_18.copyWith(color: Colors.white),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelText: 'Car Model',
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white),
  );
}
