import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/common/routing/routes.dart';
import 'package:provider/provider.dart';
import 'package:graduation/common/helper/lang_provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:graduation/features/forgot_pass/ui/ResetPass.dart';
import 'package:graduation/common/widget/animation/animation_bottom_sheet.dart';

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
  StreamSubscription? _sub;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleIncomingLinks());
  }

  void _handleIncomingLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null &&
          uri.scheme == "myapp" &&
          uri.host == "reset-password") {
        final code = uri.queryParameters["code"];
        print("🟢 Code المستلم: $code");

        if (code != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final currentContext = _navigatorKey.currentContext;
            if (currentContext != null) {
              Future.delayed(Duration.zero, () {
                showModalBottomSheet(
                  context: currentContext,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => AnimatedBottomSheet(
                    child: ResetPasswordScreen(oobCode: code),
                  ),
                );
              });
            } else {
              print("⚠️ Context غير جاهز (التطبيق لم يكتمل تحميله بعد)");
            }
          });
        } else {
          _showErrorMessage("⚠️ حدث خطأ في الرابط أو انتهت صلاحيته.");
        }
      }
    }, onError: (err) {
      _showErrorMessage("⚠️ خطأ في Deep Linking: $err");
    });
  }

  void _showErrorMessage(String message) {
    Future.delayed(Duration.zero, () {
      widget.scaffoldMessengerKey?.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.redAccent,
        ),
      );
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
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
            navigatorKey:
                _navigatorKey, // ✅ استخدم هذا المفتاح لضمان السياق الصحيح
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
