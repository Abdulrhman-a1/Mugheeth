import 'package:flutter/material.dart';
import 'package:graduation/features/chat/ui/recording.dart';

//This will open the recording screen where user can start talk and we will do speech to text!
void showRecordingScreen(BuildContext context) {
  Navigator.of(context).push(
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
}
