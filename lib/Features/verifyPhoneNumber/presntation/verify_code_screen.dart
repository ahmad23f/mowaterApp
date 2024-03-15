import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/carNumbers/presntation/sell_your_plate_screen.dart';
import 'package:Mowater/Features/spareParts/presentation/otp/otp_verify_cubit.dart';
import 'package:Mowater/Features/verifyPhoneNumber/presntation/cubit/verify_code_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/animation_loading_button.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String number;
  final String numberType;
  const VerificationCodeScreen(
      {Key? key, required this.number, required this.numberType})
      : super(key: key);

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  late BuildContext _scaffoldContext; // Store the context of the scaffold

  @override
  void initState() {
    SmsAutoFill().listenForCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Builder(
        // Use a Builder widget to get the context of the Scaffold
        builder: (BuildContext scaffoldContext) {
          _scaffoldContext = scaffoldContext; // Store the scaffold context
          return Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Verify Your Phone Number'.tr(),
                  style: TextStyles.text_30
                      .copyWith(color: ColorApp.primeryColorDark),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(12.h),
                Text.rich(
                  TextSpan(
                    text: 'We have sent the verification code to '.tr(),
                    style: TextStyles.text_16,
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.number,
                        style: TextStyle(
                          color: ColorApp.primeryColorDark,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '. Check your inbox!'.tr(),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: ColorApp.primeryColorDark,
                  focusedBorderColor: ColorApp.primeryColorDark,
                  textStyle: TextStyles.text_20,
                  fieldWidth: 50.w,
                  borderWidth: 1.0,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Optional: Handle code changes
                  },
                  onSubmit: (String verificationCode) {
                    // Send the verification code to the cubit for processing
                    BlocProvider.of<OtpVerifyCubit>(context).verifyCode(
                        widget.number, verificationCode, widget.numberType);
                  },
                ),
                SizedBox(height: 30.h),
                BlocBuilder<OtpVerifyCubit, OtpVerifyState>(
                  builder: (context, state) {
                    print(widget.numberType);
                    return state.when(
                      initial: () => LoadingButton(
                        isLoading: false,
                        onPressed: () {
                          BlocProvider.of<OtpVerifyCubit>(context).verifyCode(
                              widget.number, code, widget.numberType);
                        },
                        buttonText: 'Verify'.tr(),
                      ),
                      loading: () => LoadingButton(
                        isLoading: false,
                        onPressed: () =>
                            BlocProvider.of<OtpVerifyCubit>(context).verifyCode(
                                widget.number, code, widget.numberType),
                        buttonText: 'Verify'.tr(),
                      ),
                      success: (user) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          if (UserServices.getUserInformation().id != -1 &&
                              UserServices.getUserInformation().nickName !=
                                  'Ghost' &&
                              UserServices.getUserInformation().name != '') {
                            print(UserServices.getUserInformation().id);
                            print(UserServices.getUserInformation().name);
                            context.go(RouteName.home);
                          } else {
                            GoRouter.of(context).go(
                                RouteName.userInformationScreen,
                                extra: false);
                          }
                        });
                        return const SizedBox();
                      },
                      faliure: (error) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          print(UserServices.getUserInformation().id);
                          print(
                              ' name ${UserServices.getUserInformation().name}'
                                  .tr());
                          ShowSnakBar(
                            context,
                            title: 'Failure'.tr(),
                            iconData: Icons.info_outline_rounded,
                            messageTextStyle: TextStyles.text_16
                                .copyWith(fontWeight: FontWeight.bold),
                            content: error,
                            subtitleTextStyle: TextStyles.text_16,
                            backGroundColor:
                                Theme.of(context).colorScheme.secondary,
                          );
                        });
                        return LoadingButton(
                          isLoading: false,
                          onPressed: () =>
                              BlocProvider.of<OtpVerifyCubit>(context)
                                  .verifyCode(
                                      widget.number, code, widget.numberType),
                          buttonText: 'Verify'.tr(),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " I didn't receive a code ,".tr(),
                      style: TextStyles.text_16,
                    ),
                    InkWell(
                      onTap: () async {
                        print(widget.numberType);
                        print(widget.numberType);
                        await context.read<ResendOtpCubit>().resendOtp(
                            sendTo: widget.numberType == 'WhatsApp Number'.tr()
                                ? "whatsapp".tr()
                                : 'phone'.tr(),
                            token: UserServices.getUserInformation().token!,
                            fromTable: 'users'.tr());
                        setState(() {});
                      },
                      child: Text('Resend'.tr(),
                          style: TextStyles.text_16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorApp.primeryColorDark)),
                    )
                  ],
                ),
                BlocBuilder<ResendOtpCubit, ResendOtpState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      success: (successMessage) {
                        print('success'.tr());
                        Future(() => ShowSnakBar(
                              context,
                              title: 'Success'.tr(),
                              iconData: Icons.info_outline_rounded,
                              messageTextStyle: TextStyles.text_16
                                  .copyWith(fontWeight: FontWeight.bold),
                              content: successMessage,
                              subtitleTextStyle: TextStyles.text_16,
                              backGroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ));
                        return const SizedBox();
                      },
                      failure: (errorMessage) {
                        print(errorMessage);
                        // ShowSnakBar(
                        //   context,
                        //   title: 'Failure',
                        //   iconData: Icons.info_outline_rounded,
                        //   messageTextStyle: TextStyles.text_16
                        //       .copyWith(fontWeight: FontWeight.bold),
                        //   content: errorMessage,
                        //   subtitleTextStyle: TextStyles.text_16,
                        //   backGroundColor: Theme.of(context).colorScheme.secondary,
                        // );
                        return const SizedBox();
                      },
                      loading: () => const CircularProgressIndicator.adaptive(),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleSignUp() {
    // Add sign up logic here
  }

  @override
  void dispose() {
    super.dispose();
  }
}
