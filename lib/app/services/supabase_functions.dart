import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunctions {
  final supabaseInstace = Supabase.instance.client;

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    await supabaseInstace.auth.signInWithPassword(
      password: password,
      email: email,
    );
    print(supabaseInstace.auth.currentSession);
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    await supabaseInstace.auth.signUp(password: password, email: email);
  }

  Future<void> logOut() async {
    await supabaseInstace.auth.signOut();
  }

  static Future<void> resetPassword(String email) async {
    // Your code here
  }

  Future<void> refreshToken() async {
    if (supabaseInstace.auth.currentSession != null) {
      final expiresAt = DateTime.fromMillisecondsSinceEpoch(
        supabaseInstace.auth.currentSession!.expiresAt! * 1000,
      );
      if (expiresAt.isBefore(
        DateTime.now().subtract(
          const Duration(seconds: 2),
        ),
      )) {
        await supabaseInstace.auth.refreshSession();
      }
    }
  }

  Future<Session?> checkSession() async {
    return supabaseInstace.auth.currentSession;
  }
}
