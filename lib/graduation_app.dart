import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/common/routing/routes.dart';
import 'package:provider/provider.dart';
import 'package:graduation/common/helper/provider/lang_provider.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          child: MaterialApp(
            key: ValueKey(localeProvider.locale.languageCode),
            scaffoldMessengerKey: widget.scaffoldMessengerKey,
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
            onGenerateRoute: widget.appRouter.generateRoute,
            initialRoute: Routes.onBoarding,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
