import 'package:flutter/material.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/features/chat/logic/speech_to_text.dart';
import 'package:graduation/graduation_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //speech controller provider.
        ChangeNotifierProvider(create: (_) => SpeechController()),
        //I'll add other porivder here.
      ],
      child: GraduationApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
