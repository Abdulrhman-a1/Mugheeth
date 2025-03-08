import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';
import '../../data/auth/bloc/auth_bloc.dart';
import '../../main.dart';

final serviceLocator = GetIt.instance;

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
