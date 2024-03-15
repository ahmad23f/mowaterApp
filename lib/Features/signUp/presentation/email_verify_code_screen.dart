import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Mowater/Features/signUp/presentation/cubits/verifyEmail/verify_email_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/animation_loading_button.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';
import 'package:sms_autofill/sms_autofill.dart';

class EmailVerifeCodeScreen extends StatefulWidget {
  final String email;

  const EmailVerifeCodeScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _EmailVerifeCodeScreenState createState() => _EmailVerifeCodeScreenState();
}

class _EmailVerifeCodeScreenState extends State<EmailVerifeCodeScreen> {
  late BuildContext _scaffoldContext; // Store the context of the scaffold

  @override
  void initState() {
    SmsAutoFill().listenForCode();
    BlocProvider.of<VerifyEmailCubit>(context).resendCode(
      email: widget.email,
    );
    super.initState();
  }

  String code = '';
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
                  'Verify Your Email'.tr(),
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
                        text: widget.email,
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
                  onCodeChanged: (String newCode) {
                    // Optional: Handle code changes
                    code = newCode;
                  },
                  onSubmit: (String verificationCode) {
                    // Send the verification code to the cubit for processing
                    BlocProvider.of<VerifyEmailCubit>(context).verify(
                      email: widget.email,
                      context: context,
                      code: verificationCode,
                    );
                  },
                ),
                SizedBox(height: 30.h),
                BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => LoadingButton(
                        isLoading: false,
                        onPressed: () {
                          BlocProvider.of<VerifyEmailCubit>(context).verify(
                            context: context,
                            email: widget.email,
                            code: code,
                          );
                        },
                        buttonText: 'Verify'.tr(),
                      ),
                      loading: () => LoadingButton(
                        isLoading: false,
                        onPressed: () {},
                        buttonText: 'Verify'.tr(),
                      ),
                      success: (user) {
                        return LoadingButton(
                          isLoading: false,
                          onPressed: () {
                            BlocProvider.of<VerifyEmailCubit>(context).verify(
                              context: context,
                              email: widget.email,
                              code: code,
                            );
                          },
                          buttonText: 'Verify'.tr(),
                        );
                      },
                      failure: (error) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
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
                          onPressed: () {},
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
                        await BlocProvider.of<VerifyEmailCubit>(context)
                            .resendCode(
                          email: widget.email,
                        );
                        setState(() {});
                      },
                      child: Text('Resend'.tr(),
                          style: TextStyles.text_16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorApp.primeryColorDark)),
                    )
                  ],
                ),
                BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
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
                        Future(() => ShowSnakBar(
                              context,
                              title: 'Failure'.tr(),
                              iconData: Icons.info_outline_rounded,
                              messageTextStyle: TextStyles.text_16
                                  .copyWith(fontWeight: FontWeight.bold),
                              content: errorMessage,
                              subtitleTextStyle: TextStyles.text_16,
                              backGroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ));

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
