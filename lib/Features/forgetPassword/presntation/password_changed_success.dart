import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';

class PasswordChangedSuccessScreen extends StatelessWidget {
  const PasswordChangedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12.dg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Password Changed",
                style: TextStyles.text_30
                    .copyWith(color: ColorApp.primeryColorDark),
              ),
              verticalSpace(12.h),
              Text(
                'Your password has been changed succesfully',
                style: TextStyles.text_16,
              ),
              verticalSpace(56.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        onPressed: () {
                          context.go(RouteName.signInUser);
                        },
                        color: ColorApp.primeryColorDark,
                        textStyle:
                            TextStyles.text_16.copyWith(color: Colors.white),
                        text: 'Back to login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
