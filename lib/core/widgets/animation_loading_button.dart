import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';

class LoadingButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String buttonText;

  const LoadingButton({
    Key? key,
    required this.isLoading,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200), // Animation duration
      width: isLoading
          ? 50.w
          : mediasize(context)
              .width, // Set a specific width, shrink when loading
      height: 50.h, // Set a specific height
      decoration: BoxDecoration(
        color:
            ColorApp.primeryColorDark, // Change color as per your requirement
        borderRadius: isLoading == true
            ? BorderRadius.circular(50)
            : BorderRadius.circular(6), // Set a circular border radius
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Make button transparent
          elevation: 0, // Remove elevation
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(25), // Match container's border radius
          ),
          padding: EdgeInsets.zero, // Remove default padding
        ),
        child: isLoading
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.transparent,
                strokeCap: StrokeCap.square,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
