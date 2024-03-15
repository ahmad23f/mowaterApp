import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Mowater/core/style/text_style.dart';

class ShowConfirmDialog {
  static void show(
    BuildContext context, {
    required String message,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    String cancelButtonText = 'Cancel',
    String confirmButtonText = 'Confirm',
  }) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            message,
            style: TextStyles.text_14,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onCancel ??
                  () {
                    Navigator.pop(context); // Close the dialog
                  },
              child: Text(
                cancelButtonText,
                style: TextStyles.text_16.copyWith(color: Colors.white),
              ),
            ),
            CupertinoDialogAction(
              onPressed: onConfirm ??
                  () async {
                    Navigator.pop(context); // Close the dialog
                  },
              child: Text(
                confirmButtonText,
                style: TextStyles.text_16.copyWith(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
