import 'package:Mowater/core/constants/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/style/text_style.dart';

class ChoseAccountTypeButtons extends StatelessWidget {
  const ChoseAccountTypeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: mediasize(context).width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          colors: [
            ColorApp.categoryColorDark.withOpacity(0.96),
            ColorApp.categoryColorDark.withOpacity(0.1), // Black
          ],
          stops: const [0.8, 1],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'welcome_text'.tr(),
              textAlign: TextAlign.center,
              style: TextStyles.text_20,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          InkWell(
            onTap: () {
              context.push(RouteName.loginUserScreen);
            },
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorApp.primeryColorDark,
                    borderRadius: BorderRadius.circular(12)),
                width: mediasize(context).width,
                height: 50.h,
                child: Center(
                    child: Text(
                  "personal".tr(),
                  style: TextStyles.text_18
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.push(RouteName.loginServiceProvider);
            },
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorApp.primeryColorDark)),
                width: mediasize(context).width,
                height: 50.h,
                child: Center(
                    child: Text(
                  "provider_service".tr(),
                  style: TextStyles.text_18.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.primeryColorDark),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
