import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/routing/routing_name.dart';

Widget registerUserLink(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Already have an account? '),
      GestureDetector(
        onTap: () {
          context.pushReplacement(RouteName.signInUser);
        },
        child: Text(
          'Login Now!',
          style: TextStyle(
            color: ColorApp.primeryColorDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
