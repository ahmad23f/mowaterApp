
import 'dart:ui';

import 'package:flutter/material.dart';

class ImageViewDialog extends StatelessWidget {
  final Widget image;

  const ImageViewDialog({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: image,
        ),
      ),
    );
  }
}
