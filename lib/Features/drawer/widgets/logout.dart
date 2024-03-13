import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/company_service.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/confirm_dialog.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        ShowConfirmDialog.show(
          context,
          message: 'Are you sure you want to logout?',
          onConfirm: () async {
            await NormalCompanyService.logOut();
            await UserServices.logout();
            context.pushReplacement(
              RouteName.choseAccountTypeScreen,
            );
          },
        );
      },
      color: ColorApp.secunderyColorDark,
      child: Text(
        'Logout',
        style: TextStyles.text_16.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
