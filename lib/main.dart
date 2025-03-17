import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/common/helper/lang_provider.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/common/widget/animation/animation_bottom_sheet.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/common/helper/init_dependencies.dart';
import 'package:graduation/features/forgot_pass/ui/ResetPass.dart';
import 'package:graduation/features/recording/logic/speech_to_text.dart';
import 'package:graduation/graduation_app.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

const supabaseUrl = 'https://ioqazodipkopyqcvmqgo.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlvcWF6b2RpcGtvcHlxY3ZtcWdvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk0NDMxNzUsImV4cCI6MjA1NTAxOTE3NX0.nGhg-I-iNutl5bgRj_4KhY-pwDFn_yUhcXHy4rClvkM';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
  }

  void _handleIncomingLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        print("🔗 رابط مستلم: $uri");

        if (uri.scheme == "myapp" && uri.host == "reset-password") {
          String? code = uri.queryParameters["code"];
          print("🟢 Code المستلم: $code");

          if (code != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final currentContext = navigatorKey.currentContext;
              if (currentContext != null) {
                showModalBottomSheet(
                  showDragHandle: false,
                  context: currentContext,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: AnimatedBottomSheet(
                          child: ResetPasswordScreen(oobCode: code)),
                    );
                  },
                );
              } else {
                print("⚠️ Context is null (التطبيق لم يكتمل تحميله بعد)");
              }
            });
          } else {
            scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                content: Text("⚠️ حدث خطأ في الرابط أو انتهت صلاحيته."),
                backgroundColor: Colors.redAccent,
              ),
            );
            print("⚠️ لم يتم العثور على `code` في الرابط.");
          }
        }
      }
    }, onError: (err) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("⚠️ خطأ في Deep Linking."),
          backgroundColor: Colors.redAccent,
        ),
      );
      print("⚠️ خطأ في Deep Linking: $err");
    });
  }

  void _showResetPasswordBottomSheet(String token) {
    showModalBottomSheet(
      showDragHandle: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child:
              AnimatedBottomSheet(child: ResetPasswordScreen(oobCode: token)),
        );
      },
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SpeechController()),
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: GraduationApp(
        appRouter: AppRouter(),
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorKey: navigatorKey, // تمريره هنا
      ),
    );
  }
}
