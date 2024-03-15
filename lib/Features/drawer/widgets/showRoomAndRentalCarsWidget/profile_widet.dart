import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/services/user_hive_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:Mowater/Features/drawer/drawer.dart';
import 'package:Mowater/Features/drawer/widgets/image_view_dialog.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/networking/api_constant.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';

class PostCompanyProfile extends StatelessWidget {
  PostCompanyProfile({
    super.key,
  });
  UserHiveModel user = UserServices.getUserInformation();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13.dg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
            spreadRadius: 0.01,
            blurRadius: 4,
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      height: 250.h,
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
                                        "${ApiConstans.companyImage}${user.image}"));
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
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 40.dg,
                        backgroundImage: NetworkImage(
                            "${ApiConstans.companyImage}${user.image}"),
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
              toBeginningOfSentenceCase(user.name!)!,
              style: TextStyles.text_18.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.store_outlined),
                Text(
                  user.type ?? '',
                  style: TextStyles.text_16,
                )
              ],
            ),
            verticalSpace(12.h),
            user.phoneNumber != null && user.phoneNumber!.length >= 7
                ? Text('${user.phoneNumber!.substring(0, 7)}xxxxxxx',
                    style: TextStyles.text_14)
                : Text(
                    'Phone unregistered'.tr(),
                    style: TextStyles.text_10,
                  ),
            user.whatsAppNumber != '' && user.email != null
                ? Text(user.whatsAppNumber!, style: TextStyles.text_14)
                : Text(
                    'whatsapp Number unregistered'.tr(),
                    style: TextStyles.text_10,
                  ),
            verticalSpace(2.h),
          ],
        ),
      ),
    );
  }
}
