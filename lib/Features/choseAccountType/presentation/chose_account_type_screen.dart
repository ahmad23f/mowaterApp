import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mowaterApp/Features/choseAccountType/presentation/widgets/chose_buttns.dart';
import 'package:mowaterApp/Features/choseAccountType/presentation/widgets/skip.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/constants/size.dart';

class ChoseAccountTypeScreen extends StatefulWidget {
  const ChoseAccountTypeScreen({Key? key}) : super(key: key);

  @override
  State<ChoseAccountTypeScreen> createState() => _ChoseAccountTypeScreenState();
}

class _ChoseAccountTypeScreenState extends State<ChoseAccountTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome.jpg',
            height: mediasize(context).height,
            width: mediasize(context).width,
            color: Colors.black.withOpacity(0.35),
            colorBlendMode: BlendMode.darken,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SkipSignUpWidget(),
                  ],
                ),
                SizedBox(height: 100.h), // Adjust the space as needed

                Center(
                  child: Image.asset('assets/images/logo.png',
                      height: 250.h, color: ColorApp.primeryColorDark),
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ChoseAccountTypeButtons(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
