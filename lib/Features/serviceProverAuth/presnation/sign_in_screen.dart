import 'package:Mowater/Features/carNumbers/presntation/sell_your_plate_screen.dart';
import 'package:Mowater/Features/serviceProverAuth/presnation/widgets/spicalty_drop.dart';
import 'package:Mowater/Features/signIn/presntation/cubit/sign_in_cubit.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/validator.dart';
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

class LoginServiceProvider extends StatefulWidget {
  const LoginServiceProvider({Key? key}) : super(key: key);

  @override
  State<LoginServiceProvider> createState() => _LoginServiceProviderState();
}

class _LoginServiceProviderState extends State<LoginServiceProvider> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  String image = '';

  String type = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  color: ColorApp.primeryColorDark,
                  width: 300.w,
                  height: 200.h,
                ),
              ),
              verticalSpace(20.h),
              Text(
                'Welcome Back!'.tr(),
                style: TextStyles.text_30
                    .copyWith(color: ColorApp.primeryColorDark),
              ),
              verticalSpace(30.h),
              SignInCategoryDropDown(
                onCategoryIndexChanged: (value) {
                  type = value.toString();
                },
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: phoneNumber,
                      hintText: 'Phone Number'.tr(),
                      inputType: TextInputType.text,
                      validator: (value) {
                        return phoneNumberValidator(value!);
                      },
                    ),
                    CustomTextFormField(
                      isPasswordField: true,
                      controller: password,
                      hintText: 'Password'.tr(),
                      validator: (value) {
                        return passwordValidator(value!);
                      },
                    ),
                    const SizedBox(height: 20),
                    LoadingButton(
                        isLoading: context.read<SignInCubit>().isLoading,
                        onPressed: () async {
                          setState(() {});
                          await context.read<SignInCubit>().singIn(
                              loginType: 'phone',
                              contact: phoneNumber.text,
                              password: password.text,
                              userType: type); //todo
                          setState(() {});
                        },
                        buttonText: 'Login'.tr()),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ".tr(),
                    style: TextStyles.text_16,
                  ),
                  InkWell(
                    onTap: () {
                      context.push(
                          RouteName.serviceProviderChoseTypeAccountScreen);
                    },
                    child: Text(
                      "Sign up!".tr(),
                      style: TextStyles.text_16.copyWith(
                          color: ColorApp.primeryColorDark,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),

              const SizedBox(
                  height:
                      20), // Added some space between the form and "or" text
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(),
                    success: (messsage) {
                      UserServices.saveLoginState(messsage.user);

                      Future.delayed(
                        Duration.zero,
                        () {
                          context.pushReplacement(RouteName.home);
                        },
                      );

                      return const SizedBox();
                    },
                    failure: (errorMessage) {
                      Future.delayed(
                        Duration.zero,
                        () {
                          ShowSnakBar(context,
                              content: errorMessage,
                              title: 'Failur'.tr(),
                              backGroundColor:
                                  Theme.of(context).colorScheme.primary);
                        },
                      );
                      return const SizedBox();
                    },
                    loading: () => const SizedBox(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
