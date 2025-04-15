import 'package:flutter/material.dart';
import 'package:graduation/features/recording/ui/recording_screen.dart';

// This will open the recording screen where user can start talk and we will do speech to text!
Future<String?> showRecordingScreen(BuildContext context) async {
  final result = await Navigator.of(context).push<String>(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const RecordingScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );

  return result;
}
