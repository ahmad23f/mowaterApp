// Required for BackdropFilter

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mowaterApp/core/constants/size.dart';
import 'package:mowaterApp/core/style/text_style.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?q=80&w=1937&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: mediasize(context).width,
              height: mediasize(context).height * 0.5,
              decoration: const BoxDecoration(
                boxShadow: [
                  // BoxShadow(
                  //     spreadRadius: 0.1, blurRadius: 20, color: Colors.black)
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(197, 203, 203, 203),
                    Color.fromARGB(200, 203, 203, 203),
                    Color.fromARGB(255, 57, 57, 57),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Welcome \n To \n mowaterApp",
                    style: TextStyles.text_26.copyWith(
                        color: const Color.fromARGB(255, 17, 17, 17),
                        shadows: [
                          const Shadow(color: Colors.black, blurRadius: 20)
                        ]),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "welcome to our app we now awhe and if uou want ot go tou anlr ahos ",
                    style: TextStyles.text_18,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
