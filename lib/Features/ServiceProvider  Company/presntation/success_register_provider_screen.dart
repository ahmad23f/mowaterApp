import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/data/show_room_repo.dart';
import 'package:mowaterApp/Features/ServiceProvider%20%20Company/model/service_account.dart';
import 'package:mowaterApp/Features/signUp/data/models/user_response.dart';
import 'package:mowaterApp/core/constants/color.dart';
import 'package:mowaterApp/core/routing/routing_name.dart';
import 'package:mowaterApp/core/services/user_state.dart';
import 'package:mowaterApp/core/services/user_type.dart';
import 'package:mowaterApp/core/style/text_style.dart';
import 'package:mowaterApp/core/widgets/button.dart';

class ThankYouScreen extends StatelessWidget {
  final String userType;
  const ThankYouScreen({
    Key? key,
    required this.userType,
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
              const Text(
                'Thank you for joining us!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Your account is pending approval. We will review it as soon as possible.',
                style: TextStyle(fontSize: 16.0),
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
                        switch (userType) {
                          case 'showRooms':
                            context.push(RouteName.home);
                            break;
                          case 'Maintenance':
                            context.push(RouteName.home);

                            break;

                          case 'insurance':
                            context.push(RouteName.home);

                            break;
                          case 'rentalCars':
                            context.push(RouteName.home);

                            break;
                          case 'warranty':
                            context.push(RouteName.home);

                            break;
                          case 'spareParts':
                            context.push(RouteName.home);

                            break;
                          case 'inspection':
                            context.push(RouteName.home);

                            break;
                          case 'carCare':
                            context.push(RouteName.home);

                            break;
                          case 'mobileService':
                            context.push(RouteName.home);

                            break;
                          default:
                            break;
                        }
                      },
                      color: ColorApp.secunderyColorDark,
                      textStyle:
                          TextStyles.text_22.copyWith(color: Colors.white),
                      text: "Let’s Start",
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
