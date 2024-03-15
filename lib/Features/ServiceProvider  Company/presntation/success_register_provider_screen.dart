import 'package:Mowater/core/models/user_model.dart';
import 'package:Mowater/core/routing/routing_name.dart';
import 'package:Mowater/core/services/company_model.dart';
import 'package:Mowater/core/services/company_service.dart';
import 'package:Mowater/core/style/text_style.dart';
import 'package:Mowater/core/widgets/button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80.0,
                color: Colors.green,
              ),
              const SizedBox(height: 20.0),
              Text(
                'Thank you for joining us!'.tr(),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Text(
                'Your account is pending approval. We will review it as soon as possible.'
                    .tr(),
                style: const TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () async {
                        // Save the user state with the appropriate user type

                        context.pushReplacement(RouteName.home);
                      },
                      color: Theme.of(context).colorScheme.secondary,
                      textStyle:
                          TextStyles.text_22.copyWith(color: Colors.white),
                      text: "Let’s Start".tr(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
