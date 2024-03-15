import 'package:Mowater/Features/signIn/presntation/cubit/sign_in_cubit.dart';
import 'package:Mowater/Features/signUp/presentation/sign_up_screen.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/validator.dart';
import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/animation_loading_button.dart';
import 'package:Mowater/core/widgets/snak_bar.dart';
import 'package:Mowater/core/widgets/text_form_fiedl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInUserScreen extends StatefulWidget {
  const SignInUserScreen({Key? key}) : super(key: key);

  @override
  _SignInUserScreenState createState() => _SignInUserScreenState();
}

class _SignInUserScreenState extends State<SignInUserScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final bool _rememberMe = false; // Initialize to false initially
  final bool _showForm = false;
  late UserModel _selectedUser;
  final List<UserModel> _savedUsers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushReplacement(RouteName.loginUserScreen);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(100.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!'.tr(),
                    style: TextStyles.text_30
                        .copyWith(color: ColorApp.primeryColorDark),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email Address".tr(),
                          style: TextStyles.text_14
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'E-Mail'.tr(),
                          validator: (p0) {
                            return emailValidator(p0);
                          },
                        ),
                        verticalSpace(20.h),
                        Text(
                          "Password".tr(),
                          style: TextStyles.text_14.copyWith(
                              fontWeight: FontWeight.normal, height: 0.4),
                        ),
                        CustomTextFormField(
                          isPasswordField: true,
                          controller: _passwordController,
                          hintText: 'Password'.tr(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                context.push(RouteName.forgetPassword);
                              },
                              child: Text(
                                'Forgot password?'.tr(),
                                style: TextStyles.text_14
                                    .copyWith(color: ColorApp.primeryColorDark),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20.h),
                  Center(
                    child: LoadingButton(
                      isLoading: context.read<SignInCubit>().isLoading,
                      onPressed: () async {
                        setState(() {});
                        if (formKey.currentState!.validate()) {
                          await context.read<SignInCubit>().singIn(
                                contact: _emailController.text,
                                password: _passwordController.text,
                                loginType: 'email',
                                userType: '1',
                              );
                          setState(() {});
                        }
                      },
                      buttonText: 'Login'.tr(),
                    ),
                  ),
                  BlocBuilder<SignInCubit, SignInState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () {
                          return const SizedBox();
                        },
                        success: (user) {
                          Future(() => context.push(RouteName.home));
                          UserServices.saveLoginState(user.user);
                          return const SizedBox();
                        },
                        failure: (errorMessage) {
                          print('errror');
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
                        loading: () {
                          return const SizedBox();
                        },
                      );
                    },
                  )
                ],
              ),
              verticalSpace(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account? ".tr(),
                    style: TextStyles.text_14
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacement(RouteName.loginUserScreen);
                    },
                    child: Text(
                      "Sign up".tr(),
                      style: TextStyles.text_14
                          .copyWith(color: ColorApp.primeryColorDark),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  InkWell(child: Text("Or".tr())),
                  const Expanded(
                    child: Divider(
                      endIndent: 20,
                      indent: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GoogleSignInButton(),
                  SizedBox(width: 20),
                  AppleSignInButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
