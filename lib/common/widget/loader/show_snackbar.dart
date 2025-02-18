import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  final rootContext = Navigator.of(context).overlay?.context;

  if (rootContext != null) {
    ScaffoldMessenger.of(rootContext).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
