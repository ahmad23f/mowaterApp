import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/confirm_dialog.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero, // Remove ListTile default padding
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
          ),
          Icon(
            Icons.logout,
            color: Colors.red, // Customize icon color
          ),
          SizedBox(width: 8), // Add spacing between icon and text
          Text(
            'Logout'.tr(),
            style: TextStyles.text_16.copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
      onTap: () {
        ShowConfirmDialog.show(
          context,
          message: 'Are you sure you want to logout?'.tr(),
          onConfirm: () async {
            await UserServices.logout();
            context.pushReplacement(
              RouteName.choseAccountTypeScreen,
            );
          },
        );
      },
    );
  }
}
