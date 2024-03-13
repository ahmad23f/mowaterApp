import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("No Favorite")),
          Lottie.asset('assets/animation/no_found.json',
              options: LottieOptions(
                  enableMergePaths: false, enableApplyingOpacityToLayers: true))
        ],
      ),
    );
  }
}
