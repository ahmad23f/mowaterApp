import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart'; // Assuming ColorApp.primeryColorDark is defined in this file

class PriceSliderPlate extends StatefulWidget {
  final double maxPrice;
  final RangeValues initialRangeValues;
  final ValueChanged<RangeValues> onChanged;
  bool? showForm = true;
  PriceSliderPlate({
    Key? key,
    required this.maxPrice,
    required this.initialRangeValues,
    required this.onChanged,
    this.showForm,
  }) : super(key: key);

  @override
  _PriceSliderPlateState createState() => _PriceSliderPlateState();
}

class _PriceSliderPlateState extends State<PriceSliderPlate> {
  late RangeValues _currentRangeValues;
  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = widget.initialRangeValues;
    _minPriceController = TextEditingController(
        text: _currentRangeValues.start.toStringAsFixed(2));
    _maxPriceController =
        TextEditingController(text: _currentRangeValues.end.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.showForm == false
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Min Price:',
                            style: TextStyles.text_16
                                .copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 150.w,
                          child: TextFormField(
                            controller: _minPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}')),
                            ],
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter Min Price',
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color!
                                  .withOpacity(0.4),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              _updateSliderValues();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      children: [
                        Text('Max Price:',
                            style: TextStyles.text_16
                                .copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 150.w,
                          child: TextFormField(
                            controller: _maxPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}')),
                            ],
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter Max Price',
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color!
                                  .withOpacity(0.4),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              _updateSliderValues();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          const SizedBox(height: 20),
          Text(
            'Price Range: AED ${_currentRangeValues.start.toStringAsFixed(2)} - AED ${_currentRangeValues.end.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          RangeSlider(
            activeColor: ColorApp.primeryColorDark,
            inactiveColor: Theme.of(context).colorScheme.secondary,
            values: _currentRangeValues,
            min: 0,
            max: widget.maxPrice,
            divisions: 1000,
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
                _minPriceController.text =
                    _currentRangeValues.start.toStringAsFixed(2);
                _maxPriceController.text =
                    _currentRangeValues.end.toStringAsFixed(2);
              });
              widget.onChanged(values);
            },
            labels: RangeLabels(
              _currentRangeValues.start.toStringAsFixed(2),
              _currentRangeValues.end.toStringAsFixed(2),
            ),
          ),
        ],
      ),
    );
  }

  void _updateSliderValues() {
    double minPrice = double.tryParse(_minPriceController.text) ?? 0;
    double maxPrice =
        double.tryParse(_maxPriceController.text) ?? widget.maxPrice;
    minPrice = minPrice.clamp(0, widget.maxPrice);
    maxPrice = maxPrice.clamp(0, widget.maxPrice);
    setState(() {
      _currentRangeValues = RangeValues(minPrice, maxPrice);
    });
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }
}
