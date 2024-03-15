import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/Features/signUp/presentation/cubits/googleCubti/google_sign_in_cubit.dart';
import 'package:Mowater/Features/signUp/presentation/widget/sign_up_form.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pushReplacement(RouteName.choseAccountTypeScreen);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200.h,
                  color: ColorApp.primeryColorDark,
                ),
              ),
              loginUserForm(context),
              const SizedBox(
                  height:
                      20), // Added some space between the form and "or" text
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  InkWell(child: Text("Or")),
                  Expanded(
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

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await BlocProvider.of<GoogleSignInCubit>(context).signIn(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svg/google.svg',
            height: 20,
          ),
          const SizedBox(width: 10),
          Text('Google'.tr(), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svg/apple.svg',
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text('Apple'.tr(), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
