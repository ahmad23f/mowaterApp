import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/resetPassword/reset_passwor_cubit.dart';
import 'package:mowaterApp/Features/forgetPassword/presntation/widget/resend_timer.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/animation_loading_button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';

class VerifyResetPasswrodScreen extends StatefulWidget {
  final String email;

  const VerifyResetPasswrodScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _VerifyResetPasswrodScreenState createState() =>
      _VerifyResetPasswrodScreenState();
}

class _VerifyResetPasswrodScreenState extends State<VerifyResetPasswrodScreen> {
  late BuildContext _scaffoldContext; // Store the context of the scaffold

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
                  'Please check your email',
                  style: TextStyles.text_30
                      .copyWith(color: ColorApp.primeryColorDark),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(12.h),
                Text.rich(
                  TextSpan(
                    text: 'We have sent the verification code to ',
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
                        text: '. Check your inbox!',
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
                  onCodeChanged: (String newCode) {},
                  onSubmit: (String verificationCode) {
                    // Send the verification code to the cubit for processing
                    BlocProvider.of<ResetPassworCubit>(context).verifyCode(
                      widget.email,
                      verificationCode,
                    );
                    code = verificationCode;
                  },
                ),
                SizedBox(height: 30.h),
                BlocBuilder<ResetPassworCubit, ResetPassworState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => LoadingButton(
                        isLoading: false,
                        onPressed: () async {},
                        buttonText: 'Verify',
                      ),
                      loading: () => LoadingButton(
                        isLoading: false,
                        onPressed: () {},
                        buttonText: 'Verify',
                      ),
                      success: (user) {
                        return LoadingButton(
                          isLoading: false,
                          onPressed: () async {
                            await BlocProvider.of<ResetPassworCubit>(context)
                                .verifyCode(widget.email, code);
                            setState(() {});
                          },
                          buttonText: 'Verify',
                        );
                      },
                      failure: (error) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          ShowSnakBar(
                            context,
                            title: 'Failure',
                            iconData: Icons.info_outline_rounded,
                            messageTextStyle: TextStyles.text_16
                                .copyWith(fontWeight: FontWeight.bold),
                            content: error,
                            subtitleTextStyle: TextStyles.text_16,
                            backGroundColor: ColorApp.secunderyColorDark,
                          );
                        });
                        return LoadingButton(
                          isLoading: BlocProvider.of<ResetPassworCubit>(context)
                              .isLoading,
                          onPressed: () async {
                            await BlocProvider.of<ResetPassworCubit>(context)
                                .verifyCode(widget.email, code);
                            setState(() {});
                          },
                          buttonText: 'Verify',
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 10.h),
                InkWell(
                    onTap: () {
                      code = '';
                    },
                    child: ResendTimer(email: widget.email)),
                BlocBuilder<ResetPassworCubit, ResetPassworState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      success: (success) {
                        // Show success message

                        if (code.isNotEmpty && code.length > 4) {
                          // Navigate to the reset password screen
                          Future.delayed(Duration.zero, () {
                            context.go(RouteName.resetPasswordScreen,
                                extra: success.id);
                          });
                        }
                        return const SizedBox();
                      },
                      failure: (errorMessage) {
                        print(errorMessage);
                        Future(() => ShowSnakBar(
                              context,
                              title: 'Failure',
                              iconData: Icons.info_outline_rounded,
                              messageTextStyle: TextStyles.text_16
                                  .copyWith(fontWeight: FontWeight.bold),
                              content: errorMessage,
                              subtitleTextStyle: TextStyles.text_16,
                              backGroundColor: ColorApp.secunderyColorDark,
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
