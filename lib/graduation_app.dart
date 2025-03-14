import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/common/routing/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:graduation/common/helper/lang_provider.dart';

class GraduationApp extends StatelessWidget {
  final AppRouter appRouter;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  const GraduationApp({
    super.key,
    required this.appRouter,
    this.scaffoldMessengerKey,
  });

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        key: ValueKey(localeProvider.locale.languageCode),
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'Mugheeth App',
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: localeProvider.locale.languageCode == 'ar'
              ? 'IBMPlexSansArabic'
              : 'Share',
        ),
        locale: localeProvider.locale,
        supportedLocales: const [
          Locale('ar', ''),
          Locale('en', ''),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
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
