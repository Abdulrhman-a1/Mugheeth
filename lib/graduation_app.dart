import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/common/routing/routes.dart';

class GraduationApp extends StatelessWidget {
  final AppRouter appRouter;

  const GraduationApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Responsive UI
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Mugheeth App',
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'IBMPlexSansArabic',
        ),
        locale: const Locale('ar'), // Arabic as the default language
        supportedLocales: const [
          Locale('ar', ''),
          Locale('en', ''),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoarding,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
