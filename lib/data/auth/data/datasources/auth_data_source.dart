import 'package:graduation/common/helper/error/exceptions.dart';
import 'package:graduation/data/auth/data/models/user_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
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
}

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient client;
  AuthDataSourceImpl(this.client);

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
}
