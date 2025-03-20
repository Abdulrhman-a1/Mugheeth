import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/init_dependencies.dart';
import 'package:graduation/common/helper/provider/lang_provider.dart';
import 'package:graduation/common/routing/app_router.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/features/recording/logic/speech_to_text.dart';
import 'package:graduation/graduation_app.dart';
import 'package:provider/provider.dart';

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
