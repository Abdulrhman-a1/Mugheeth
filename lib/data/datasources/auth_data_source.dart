import 'package:graduation/common/helper/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSource {
  Future<String> signUpwithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<String> loginwithEmailAndPassword(
      {required String email, required String password, required String name});
}

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient client;
  AuthDataSourceImpl(this.client);

  @override
  Future<String> loginwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) {
    // TODO: implement loginwithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final respons = await client.auth.signUp(
        password: password,
        email: email,
        data: {"name": name},
      );
      if (respons.user == null) {
        throw const ServerException("user is null");
      }
      return respons.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
