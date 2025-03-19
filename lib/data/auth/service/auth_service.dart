import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // ValueNotifier to hold and update the username dynamically
  final ValueNotifier<String?> userNameNotifier = ValueNotifier<String?>(null);

  AuthService() {
    // Automatically fetch the username when the service is initialized
    _fetchCurrentUserName();
  }

  // Sign in with email and password
  Future<AuthResponse?> signInWithEmailPassword(
      String email, String password) async {
    try {
      print('Attempting sign-in with email: $email');

      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        print('Sign-in successful. User ID: ${response.user?.id}');
        await _fetchCurrentUserName(); // Fetch and update the username
        return response;
      } else {
        print('Sign-in failed. No session returned.');
        return null;
      }
    } catch (e) {
      print('Sign-in error: $e');
      return null;
    }
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
      print('Password reset email sent successfully to $email.');
    } catch (e) {
      print('Failed to send password reset email: $e');
      throw Exception('Failed to send password reset email.');
    }
  }

// Confirm password reset
  Future<void> updateUserPassword(String oobCode, String newPassword) async {
    try {
      await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      print('تم تحديث كلمة المرور بنجاح');
    } catch (e) {
      print('خطأ أثناء إعادة تعيين كلمة المرور: $e');
      throw Exception('فشل في إعادة تعيين كلمة المرور');
    }
  }

  // get user id
  String? getCurrentUserId() {
    final session = Supabase.instance.client.auth.currentSession;
    return session?.user.id;
  }

  // Submit feedback
  Future<void> submitFeedback(String feedbackText) async {
    try {
      final session = _supabase.auth.currentSession;
      final user = session?.user;

      if (user != null) {
        final response = await _supabase.from('feedback').insert({
          'user_id': user.id,
          'feedback_text': feedbackText,
          'created_at': DateTime.now().toIso8601String(),
        }).select();

        if (response.isNotEmpty) {
          print('Feedback submitted successfully.');
        } else {
          print('Failed to submit feedback: ');
        }
      } else {
        print('No user currently signed in.');
      }
    } catch (e) {
      print('Error submitting feedback: $e');
    }
  }

  // Sign up with email and password
  Future<AuthResponse?> signUpWithEmailPassword(String email, String password,
      String gender, String Bdata, String Name) async {
    try {
      print('Attempting sign-up with: Email: $email, Name: $Name');

      final response = await _supabase.auth.signUp(
        data: {'gender': gender, 'Bdata': Bdata, 'name': Name},
        email: email,
        password: password,
      );

      if (response.user != null) {
        print('Sign-up successful. User ID: ${response.user?.id}');
        await _fetchCurrentUserName(); // Fetch and update the username
        return response;
      } else {
        print('Sign-up failed. No user created.');
        return null;
      }
    } catch (e) {
      print('Sign-up error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      print('Attempting to sign out current user.');
      await _supabase.auth.signOut();
      userNameNotifier.value = null; // Clear the username
      print('User signed out successfully.');
    } catch (e) {
      print('Sign-out error: $e');
    }
  }

  // Fetch the current user's name and update the notifier
  Future<void> _fetchCurrentUserName() async {
    try {
      final session = _supabase.auth.currentSession;
      final user = session?.user;

      if (user != null) {
        final userId = user.id;
        final response = await _supabase
            .from('users')
            .select('name')
            .eq('id', userId)
            .single();

        if (response['name'] != null) {
          final userName = response['name'] as String;
          print('Current user Name: $userName');
          userNameNotifier.value = userName;
        } else {
          print('User name not found in the profile data.');
          userNameNotifier.value = null;
        }
      } else {
        print('No user currently signed in.');
        userNameNotifier.value = null;
      }
    } catch (e) {
      print('Get current user Name error: $e');
      userNameNotifier.value = null;
    }
  }

  // Get current user email
  String? getCurrentUserEmail() {
    try {
      final session = _supabase.auth.currentSession;
      final user = session?.user;

      if (user != null) {
        print('Current user email: ${user.email}');
        return user.email;
      } else {
        print('No user currently signed in.');
        return null;
      }
    } catch (e) {
      print('Get current user email error: $e');
      return null;
    }
  }

  // Update user data in the Supabase database
  Future<void> updateUserData(Map<String, dynamic> data) async {
    try {
      final session = _supabase.auth.currentSession;
      final user = session?.user;

      if (user != null) {
        final userId = user.id;
        final response = await _supabase
            .from('users')
            .update(data)
            .eq('id', userId)
            .select();

        if (response.isNotEmpty) {
          print('User data updated successfully: $data');
        } else {
          print('Failed to update user data.');
        }
      } else {
        print('No user currently signed in.');
      }
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

// Update user password
  Future<void> editUserPassword(String password) async {
    try {
      final response = await _supabase.auth.updateUser(
        UserAttributes(password: password),
      );

      if (response.user != null) {
        print('User password updated successfully.');
      }
    } catch (e) {
      print('Error updating password: $e');
    }
  }

  // Fetch user data from the Supabase database
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final session = _supabase.auth.currentSession;
      final user = session?.user;

      if (user != null) {
        final response =
            await _supabase.from('users').select().eq('id', user.id).single();

        if (response['id'] != null) {
          print('User data fetched successfully: ${response}');
          return response;
        } else {
          print('Failed to fetch user data: No data found.');
        }
      } else {
        print('No user currently signed in.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }
}
