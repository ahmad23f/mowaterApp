import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/addNumberForAccount/presntation/cubit/account_number_cubit.dart';
import 'package:Mowater/Features/addNumberForAccount/presntation/phone_text_field.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';

class AddAccountNumberScreen extends StatelessWidget {
  String userToken;
  String? numberType = 'phone'.tr();
  AddAccountNumberScreen({super.key, required this.userToken, this.numberType});
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext mContext) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () {
                mContext.push(RouteName.userInformationScreen, extra: false);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0.dg),
                child: Text(
                  'Skip'.tr(),
                  style: TextStyles.text_16,
                ),
              ),
            )
          ],
          title: Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: 5.w),
                height: 2,
                decoration: BoxDecoration(color: ColorApp.primeryColorDark),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 2,
                decoration: BoxDecoration(color: ColorApp.primeryColorDark),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 2,
                decoration: BoxDecoration(
                    color: Theme.of(mContext).colorScheme.secondary),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 2,
                decoration: BoxDecoration(
                    color: Theme.of(mContext).colorScheme.secondary),
              )),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Your Number".tr(),
              style:
                  TextStyles.text_30.copyWith(color: ColorApp.primeryColorDark),
            ),
            verticalSpace(13.h),
            Text(
              'Register And Confirm Your Number To Get Additional Benefits'
                  .tr(),
              style: TextStyles.text_16,
            ),
            verticalSpace(35.h),
            Divider(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Image.asset('assets/images/uae_flag.png'),
                ),
                horizontalSpace(18.w),
                Text(
                  "United Arab Emirates ".tr(),
                  style: TextStyles.text_14,
                )
              ],
            ),
            Divider(
              height: 20.h,
            ),
            Form(
                key: formKey,
                child: PhoneNumberFormField(controller: numberController)),
            verticalSpace(35.h),
            BlocBuilder<AccountNumberCubit, AccountNumberState>(
              builder: (context, state) {
                return CustomButton(
                  padding:
                      EdgeInsets.symmetric(horizontal: 130.w, vertical: 15.h),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      showAdaptiveDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirm Number".tr()),
                            content: Text(
                                "Is this your number: ${numberController.text} ?"
                                    .tr()),
                            actionsPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: Text("No".tr()),
                                  ),
                                  // TextButton(
                                  //   onPressed: () async {
                                  //     if (numberType == 'Phone Number'.tr()) {
                                  //       print('update'.tr());
                                  //       print('number type: $numberType'.tr());
                                  //       UserServices.updateUserInfo(
                                  //           phoneNumber: '0');
                                  //       mContext
                                  //           .read<UpdateUserInfoCubit>()
                                  //           .update(
                                  //             user: UserModel(
                                  //                 phoneNumber: '0',
                                  //                 userType: UserServices
                                  //                         .getUserInformation()
                                  //                     .userType),
                                  //           );
                                  //     } else {
                                  //       print('update'.tr());
                                  //       print('number type: $numberType'.tr());
                                  //       UserServices.updateUserInfo(
                                  //           whatsappNumber: '0');
                                  //       mContext
                                  //           .read<UpdateUserInfoCubit>()
                                  //           .update(
                                  //             user: UserModel(
                                  //                 userType: UserServices
                                  //                         .getUserInformation()
                                  //                     .userType,
                                  //                 whatsappNumber: '0'),
                                  //           );
                                  //     }

                                  //     await mContext
                                  //         .read<AccountNumberCubit>()
                                  //         .updateUserNumber(
                                  //             userToken: userToken,
                                  //             number: numberController.text,
                                  //             numberType: numberType);

                                  //     await mContext.push(
                                  //         RouteName.verificationCodeScreen,
                                  //         extra: {
                                  //           'number'.tr():
                                  //               numberController.text,
                                  //           'numberType'.tr(): numberType
                                  //         });
                                  //   },
                                  //   child: Text("Yes".tr()),
                                  // ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  color: ColorApp.primeryColorDark,
                  textStyle: TextStyles.text_18.copyWith(color: Colors.white),
                  text: 'Continue'.tr(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
