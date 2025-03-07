import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/common/routing/routes.dart';

class GraduationApp extends StatefulWidget {
  final AppRouter appRouter;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  const GraduationApp({
    super.key,
    required this.appRouter,
    this.scaffoldMessengerKey,
  });

  @override
  State<GraduationApp> createState() => _GraduationAppState();
}

class _GraduationAppState extends State<GraduationApp> {
  void intiState() {
    super.initState();
    // context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        scaffoldMessengerKey: widget.scaffoldMessengerKey,
        title: 'Mugheeth App',
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'IBMPlexSansArabic',
        ),
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar', ''),
          Locale('en', ''),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: widget.appRouter.generateRoute,
        initialRoute: Routes.onBoarding,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
