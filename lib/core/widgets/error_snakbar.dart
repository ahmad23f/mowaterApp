import 'package:flutter/material.dart';

Future errorSnakBar(context, String errorMessage) {
  return Future.delayed(
    Duration.zero,
    () {
      ScaffoldMessenger.of(context).clearSnackBars();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    },
  );
}
