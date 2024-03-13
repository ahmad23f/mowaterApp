import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/carNumbers/presntation/sell_your_plate_screen.dart';
import 'package:mowaterApp/Features/serviceProverAuth/presnation/signIn/sign_in_company_cubit.dart';
import 'package:mowaterApp/Features/serviceProverAuth/presnation/widgets/specialty_drop_down.dart';
import 'package:mowaterApp/Features/serviceProverAuth/presnation/widgets/spicalty_drop.dart';
import 'package:mowaterApp/Features/signUp/presentation/widget/register_link.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/helper/validator.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';
import 'package:mowaterApp/core/widgets/snak_bar.dart';
import 'package:mowaterApp/core/widgets/text_form_fiedl.dart';

class LoginServiceProvider extends StatelessWidget {
  LoginServiceProvider({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String image = '';
  String tabelName = '';
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
                'Welcome Back!',
                style: TextStyles.text_30
                    .copyWith(color: ColorApp.primeryColorDark),
              ),
              verticalSpace(30.h),
              SignInCategoryDropDown(
                onCategoryChanged: (value) {
                  tabelName = value;
                },
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: phoneNumber,
                      hintText: 'Phone Number',
                      inputType: TextInputType.text,
                      validator: (value) {
                        return phoneNumberValidator(value!);
                      },
                    ),
                    CustomTextFormField(
                      isPasswordField: true,
                      controller: password,
                      hintText: 'Password',
                      validator: (value) {
                        return passwordValidator(value!);
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              onPressed: () async {
                                await context.read<SignInCompanyCubit>().signIn(
                                    phoneNumber: phoneNumber.text,
                                    password: password.text,
                                    tableName: tabelName);
                              },
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              color: ColorApp.primeryColorDark,
                              textStyle: TextStyles.text_18
                                  .copyWith(color: Colors.white),
                              text: 'Login'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyles.text_16,
                  ),
                  InkWell(
                    onTap: () {
                      context.push(
                          RouteName.serviceProviderChoseTypeAccountScreen);
                    },
                    child: Text(
                      "Sign up!",
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
              BlocBuilder<SignInCompanyCubit, SignInCompanyState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(),
                    success: (messsage) {
                      Future.delayed(
                        Duration.zero,
                        () {
                          ShowSnakBar(context,
                              content: messsage.message,
                              title: 'Success',
                              backGroundColor: Colors.green);
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
                              title: 'Failur',
                              backGroundColor: Colors.red);
                        },
                      );
                      return const SizedBox();
                    },
                    loading: () => const CircularProgressIndicator.adaptive(),
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
