import 'package:flutter/material.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/style/text_style.dart';

class ProductStateFilter extends StatefulWidget {
  final String selectedState;
  final void Function(String)? onSelected;
  List<String> states;
  ProductStateFilter({
    Key? key,
    required this.selectedState,
    required this.onSelected,
    required this.states,
  }) : super(key: key);

  @override
  State<ProductStateFilter> createState() => _ProductStateFilterState();
}

class _ProductStateFilterState extends State<ProductStateFilter> {
  late String _currentSelectedState;

  @override
  void initState() {
    _currentSelectedState = widget.selectedState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: widget.states.map((state) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _currentSelectedState = state;
                  });
                  widget.onSelected?.call(state);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _currentSelectedState == state
                          ? ColorApp.primeryColorDark
                          : Theme.of(context).textTheme.titleSmall!.color!),
                  child: Text(
                    state,
                    style: TextStyles.text_16,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
