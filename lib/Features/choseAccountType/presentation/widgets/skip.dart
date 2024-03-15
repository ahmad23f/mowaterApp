import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/size.dart';
import 'package:Mowater/core/helper/generate_token.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/user_state.dart';
import 'package:Mowater/core/style/text_style.dart';

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
              context.push(RouteName.home);
            },
            child: Text(
              'skip'.tr(),
              style: TextStyles.text_18.copyWith(
                shadows: [
                  const Shadow(
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
