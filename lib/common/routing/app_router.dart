import 'package:flutter/material.dart';
import 'package:graduation/common/routing/routes.dart';
import 'package:graduation/features/Onbording/ui/on_boarding_screen.dart';
import 'package:graduation/features/chat/ui/chat_screen.dart';
import 'package:graduation/features/setting/ui/profile_screen.dart';

///Class to handle routing in the app; it uses route name and build the screen when called.
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
        );

      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      default:
        return null;
    }
  }
}
