import 'package:flutter/material.dart';

class FlashMessages {
  static void errorMsg({
    required BuildContext context,
    required String errorTitle,
    required String errorDesc,
  }) {
    _showSnackbar(context, errorTitle, errorDesc, Colors.red);
  }

  static void successMsg({
    required BuildContext context,
    required String successTitle,
    required String successDesc,
  }) {
    _showSnackbar(context, successTitle, successDesc, Colors.green);
  }

  static void _showSnackbar(
      BuildContext context, String title, String desc, Color color) {
    final snackBar = SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            desc,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}