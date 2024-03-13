import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 72, 72, 72),
      highlightColor: const Color.fromARGB(255, 66, 66, 66),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 106, 106, 106),
            borderRadius: BorderRadius.circular(6)),
        width: width,
        height: height,
      ),
    );
  }
}
