import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mowaterApp/core/constants/color.dart';

class FoldableOptions extends StatefulWidget {
  const FoldableOptions({super.key});

  @override
  _FoldableOptionsState createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  final List<Widget> options = [
    Image.asset('assets/images/recovery.png'),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/images/battery_fix.png',
        color: Colors.white,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/images/wheel_fix.png',
        color: Colors.white,
      ),
    ),
  ];

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;
  late Animation<Alignment> fourthAnim;
  late Animation<Alignment> fifthAnim;
  late Animation<double> verticalPadding;
  late AnimationController controller;
  final duration = const Duration(milliseconds: 190);

  Widget getItem(Widget source) {
    const size = 55.0;
    return GestureDetector(
      onTap: () {
        controller.reverse();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: ColorApp.primeryColorDark,
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: source),
      ),
    );
  }

  Widget buildPrimaryItem(IconData source) {
    const size = 65.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: ColorApp.primeryColorDark,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorApp.primeryColorDark,
            blurRadius: verticalPadding.value,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/call_24.png'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);

    final anim = CurvedAnimation(parent: controller, curve: Curves.linear);
    firstAnim =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topRight)
            .animate(anim);
    secondAnim =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topLeft)
            .animate(anim);
    thirdAnim = Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.centerLeft)
        .animate(anim);
    fourthAnim = Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.bottomLeft)
        .animate(anim);
    fifthAnim = Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.bottomRight)
        .animate(anim);
    verticalPadding = Tween<double>(begin: 0, end: 26).animate(anim);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      margin: const EdgeInsets.only(
        right: 15,
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: firstAnim.value,
                child: getItem(
                  options.elementAt(0),
                ),
              ),
              Align(
                alignment: secondAnim.value,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 30, top: verticalPadding.value),
                  child: getItem(
                    options.elementAt(1),
                  ),
                ),
              ),
              Align(
                alignment: thirdAnim.value,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: getItem(
                    options.elementAt(2),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    controller.isCompleted
                        ? controller.reverse()
                        : controller.forward();
                  },
                  child: buildPrimaryItem(
                    controller.isCompleted || controller.isAnimating
                        ? Icons.close
                        : Icons.add,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
