import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';

class AnnymousNotAllowedWidget extends StatelessWidget {
  String text;
  AnnymousNotAllowedWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.text_16,
            ),
            CustomButton(
                onPressed: () async {
                  await UserServices.logout();
                  context.push(
                    RouteName.choseAccountTypeScreen,
                  );
                },
                color: ColorApp.primeryColorDark,
                textStyle: TextStyles.text_14
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                text: 'Login Now!')
          ],
        ),
      ),
    );
  }
}
