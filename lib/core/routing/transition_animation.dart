import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({
    Key? key,
    required Widget child,
  }) : super(
          child: child,
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final isPushing =
                secondaryAnimation.status == AnimationStatus.reverse;
            final tween = Tween(
              begin: isPushing ? const Offset(1.5, 0) : const Offset(-1.5, 0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.ease),
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
