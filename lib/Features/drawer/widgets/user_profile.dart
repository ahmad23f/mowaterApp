import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mowaterApp/Features/drawer/drawer.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/networking/api_constant.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_model.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class UserProfileWidget extends StatelessWidget {
  UserProfileWidget({
    super.key,
  });
  User user = UserServices.getUserInformation();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13.dg),
      decoration: BoxDecoration(
        color: ColorApp.secunderyColorDark,
        boxShadow: [
          BoxShadow(
            color: ColorApp.secunderyColorDark.withOpacity(0.25),
            spreadRadius: 0.01,
            blurRadius: 4,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      height: 214.h,
      child: Padding(
        padding: EdgeInsets.all(13.dg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.dg),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      user.image != null && user.image!.isNotEmpty
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ImageViewDialog(
                                    image: Image.network(
                                        height: 300,
                                        width: 300,
                                        "${ApiConstans.userImage}${user.image}"));
                              },
                            )
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ImageViewDialog(
                                    image: Container(
                                  decoration: const BoxDecoration(),
                                  child: Image.asset(
                                      height: 300,
                                      width: 300,
                                      'assets/images/logo.png'),
                                ));
                              },
                            );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorApp.primeryColorDark,
                          width: 1.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: ColorApp.secunderyColorDark,
                        radius: 40.dg,
                        backgroundImage: NetworkImage(
                            "${ApiConstans.userImage}${user.image}"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(RouteName.userInformationScreen,
                          extra: true);
                    },
                    child: Image.asset(
                      'assets/images/person_edit.png',
                      height: 50.h,
                      width: 25.w,
                      color: ColorApp.primeryColorDark,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(12.h),
            Text(
              toBeginningOfSentenceCase(user.username!)!,
              style: TextStyles.text_18.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            user.email != '' && user.email != null
                ? Text(user.email!, style: TextStyles.text_14)
                : Text(
                    'Email unregistered',
                    style: TextStyles.text_10,
                  ),
            verticalSpace(2.h),
            user.phoneNumber != null && user.phoneNumber!.length >= 7
                ? Text('${user.phoneNumber!.substring(0, 7)}xxxxxxx',
                    style: TextStyles.text_14)
                : Text(
                    'Phone unregistered',
                    style: TextStyles.text_10,
                  ),
          ],
        ),
      ),
    );
  }
}
