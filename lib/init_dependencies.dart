import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';
import 'data/auth/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;
const supabaseUrl = 'https://ioqazodipkopyqcvmqgo.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlvcWF6b2RpcGtvcHlxY3ZtcWdvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk0NDMxNzUsImV4cCI6MjA1NTAxOTE3NX0.nGhg-I-iNutl5bgRj_4KhY-pwDFn_yUhcXHy4rClvkM';

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: true,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
  _initAuth();
}

void _initAuth() {
  serviceLocator
    ..registerLazySingleton(
      () => AuthService(),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        authService: serviceLocator(),
      ),
    );
}
