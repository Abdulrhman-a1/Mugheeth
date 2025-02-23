import 'package:graduation/common/helper/error/exceptions.dart';
import 'package:graduation/data/auth/data/models/user_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
  Session? get currentUserSession;
  Future<UserModels> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String Bdata,
    required String gender,
  });
  Future<UserModels> loginwithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserModels?> getCurrentUserData() {
    throw UnimplementedError();
  }
}

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient client;
  AuthDataSourceImpl(this.client);

  @override
  Session? get currentUserSession => client.auth.currentSession;

  @override
  Future<UserModels> loginwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final respons = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (respons.user == null) {
        throw const ServerException("user is null");
      }
      return UserModels.fromJson(respons.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModels> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String Bdata,
    required String gender,
  }) async {
    try {
      final respons = await client.auth.signUp(
        password: password,
        email: email,
        data: {
          "name": name,
          "Bdata": Bdata,
          "gender": gender,
        },
      );
      if (respons.user == null) {
        throw const ServerException("user is null");
      }
      return UserModels.fromJson(respons.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModels?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final respons = await client
            .from('users')
            .select('*')
            .eq('id', currentUserSession!.user.id);

        if (respons.isEmpty) {   
          throw const ServerException("user is null");
        }
        return UserModels.fromJson(respons.first).copyWith(
          email: currentUserSession!.user.email,
        );
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
