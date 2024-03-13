import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class SingleSelectionContainerGroup extends StatefulWidget {
  final int numberOfContainers;
  final Function(int) onChanged;
  final int selectedIndex;

  const SingleSelectionContainerGroup({
    Key? key,
    required this.numberOfContainers,
    required this.onChanged,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _SingleSelectionContainerGroupState createState() =>
      _SingleSelectionContainerGroupState();
}

class _SingleSelectionContainerGroupState
    extends State<SingleSelectionContainerGroup> {
  late List<Color> containerColors;

  @override
  void initState() {
    super.initState();
    containerColors = List<Color>.generate(
      widget.numberOfContainers,
      (index) => index == widget.selectedIndex
          ? ColorApp.primeryColorDark
          : ColorApp.secunderyColorDark, // Initialize with default color
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.numberOfContainers, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              containerColors = List<Color>.generate(
                widget.numberOfContainers,
                (idx) => idx == index
                    ? ColorApp.primeryColorDark
                    : ColorApp.secunderyColorDark,
              );
              widget.onChanged(index);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 65.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: containerColors[index],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                  (index + 1).toString(), // Display index starting from 1
                  style:
                      TextStyles.text_20.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
        );
      }),
    );
  }
}
