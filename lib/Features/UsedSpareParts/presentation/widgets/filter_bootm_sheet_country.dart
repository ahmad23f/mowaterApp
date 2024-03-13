import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class EmirateNameCountryFilter extends StatefulWidget {
  final List<String> emirates;
  final String selectedEmirate;
  final void Function(String)? onSelected;

  const EmirateNameCountryFilter({
    Key? key,
    required this.emirates,
    required this.selectedEmirate,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<EmirateNameCountryFilter> createState() =>
      _EmirateNameCountryFilterState();
}

class _EmirateNameCountryFilterState extends State<EmirateNameCountryFilter> {
  late String _selectedEmirate;

  @override
  void initState() {
    _selectedEmirate = widget.selectedEmirate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Emirate Country',
            style: TextStyles.text_16.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50.h,
            width: mediasize(context).width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.emirates.length,
                itemBuilder: (context, index) => Center(
                      child: EmirateContainer(
                        emirate: widget.emirates[index],
                        isSelected: widget.emirates[index] == _selectedEmirate,
                        onTap: () {
                          setState(() {
                            _selectedEmirate = widget.emirates[index];
                          });
                          widget.onSelected?.call(widget.emirates[index]);
                        },
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}

class EmirateContainer extends StatelessWidget {
  final String emirate;
  final bool isSelected;
  final VoidCallback onTap;

  const EmirateContainer({
    Key? key,
    required this.emirate,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? ColorApp.primeryColorDark : Colors.black26,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected
                ? ColorApp.primeryColorDark
                : ColorApp.secunderyColorDark,
            width: 2.0,
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          emirate,
          style: isSelected
              ? TextStyles.text_16.copyWith(color: Colors.white)
              : TextStyles.text_16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
