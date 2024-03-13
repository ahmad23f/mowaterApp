import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/helper/generate_token.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class SkipSignUpWidget extends StatelessWidget {
  const SkipSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              await UserServices.saveAnonymousState(
                  'Ghost',
                  '',
                  generateToken(),
                  -1,
                  '',
                  'user',
                  '',
                  '',
                  DateTime(0),
                  DateTime(0),
                  0,
                  0,
                  '  0   ',
                  0);
              context.push(RouteName.home);
            },
            child: Text(
              'skip'.tr(),
              style: TextStyles.text_18.copyWith(
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                  )
                ],
              ),
            ),
          ),
          const Icon(Icons.skip_next_outlined),
        ],
      ),
    );
  }
}
