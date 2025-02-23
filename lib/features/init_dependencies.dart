import 'package:graduation/data/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';
import '../data/auth/bloc/auth_bloc.dart';
import '../data/auth/data/datasources/auth_data_source.dart';
import '../data/auth/domain/usecases/current_user.dart';
import '../data/auth/domain/usecases/user_sign_in.dart';
import '../data/auth/domain/usecases/user_sign_up.dart';
import '../data/auth/data/repo/auth_repo_impl.dart';
import '../main.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
  _initAuth();
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthDataSource>(
      () => AuthDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepo>(
      () => AuthRepoImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignIn(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        currentUser: serviceLocator(),
        userSignUp: serviceLocator(),
        userSignIn: serviceLocator(),
      ),
    );
}
