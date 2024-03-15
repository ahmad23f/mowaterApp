import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cubit/CarBrands/car_brands_cubit.dart';
import 'package:Mowater/Features/CareForSaleBrand/presentation/cubit/carModelsBrand/car_models_brands_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/di/dependency_injection.dart';
import 'package:Mowater/core/helper/reqexp.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:Mowater/core/widgets/loading/shimmer_widget.dart';

class CarNameDropChipChoseWidget extends StatefulWidget {
  final TextEditingController carNameController;
  final void Function(List<int>)? onChanged;

  const CarNameDropChipChoseWidget({
    Key? key,
    required this.carNameController,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CarNameDropChipChoseWidget> createState() =>
      _CarNameDropChipChoseWidgetState();
}

class _CarNameDropChipChoseWidgetState
    extends State<CarNameDropChipChoseWidget> {
  List<int> _selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CarBrandsCubit>()..getAllBrands(),
        ),
        BlocProvider(
          create: (context) => getIt<CarModelsBrandsCubit>(),
        ),
      ],
      child: BlocBuilder<CarBrandsCubit, CarBrandsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            success: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onPressed: () {
                        setState(() {
                          if (_selectedIndices.length == data.length) {
                            // If all brands are selected, deselect all
                            _selectedIndices.clear();
                            widget.carNameController.clear();
                          } else {
                            // If not all brands are selected, select all
                            _selectedIndices =
                                List.generate(data.length, (index) => index);
                            widget.carNameController.text = _selectedIndices
                                .map((index) => data[index].name)
                                .join(', ');
                          }
                          widget.onChanged?.call(_selectedIndices);
                        });
                      },
                      text: _selectedIndices.length == data.length
                          ? 'Deselect All'.tr()
                          : 'Select All'.tr(),
                      color: ColorApp.primeryColorDark,
                      textStyle:
                          TextStyles.text_18.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Wrap(
                  children: data.asMap().entries.map((entry) {
                    final index = entry.key;
                    final brand = entry.value;
                    return Padding(
                      padding: EdgeInsets.all(4.0.dg),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedIndices.contains(index)) {
                              _selectedIndices.remove(index);
                            } else {
                              _selectedIndices.add(index);
                            }
                            widget.carNameController.text = _selectedIndices
                                .map((index) => data[index].name)
                                .join(', ');
                            widget.onChanged?.call(_selectedIndices);
                          });
                        },
                        child: Chip(
                          label: Text(AppRegex.extractEnglishText(brand.name)),
                          backgroundColor: _selectedIndices.contains(index)
                              ? ColorApp.primeryColorDark
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            faliure: (error) {
              return const Text("");
            },
            loading: () => ShimmerWidget(
              width: mediasize(context).width,
              height: 55.h,
            ),
          );
        },
      ),
    );
  }
}
