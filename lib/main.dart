import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/common/helper/init_dependencies.dart';
import 'package:graduation/common/helper/lang_provider.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/features/recording/logic/speech_to_text.dart';
import 'package:graduation/graduation_app.dart';
import 'package:provider/provider.dart';

const supabaseUrl = 'https://ioqazodipkopyqcvmqgo.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlvcWF6b2RpcGtvcHlxY3ZtcWdvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk0NDMxNzUsImV4cCI6MjA1NTAxOTE3NX0.nGhg-I-iNutl5bgRj_4KhY-pwDFn_yUhcXHy4rClvkM';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SpeechController()),
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
        //whenever we will add new word to json run this; flutter gen-l10n
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: GraduationApp(
        appRouter: AppRouter(),
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    ),
  );
}
