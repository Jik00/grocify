import 'dart:developer';
import 'package:grocify/core/services/get_it_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  Future<User> signUpWithEmail(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      //final Session? session = res.session;
      final User user = res.user!;

      return user;
    } on Exception catch (e) {
      log('Error in SupabaseAuthService.signUpWithEmail: ${e.toString()}');
      throw Exception('فشل في انشاء الحساب.');
    }
  }

  Future<User> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      // final Session? session = res.session;

      final User user = res.user!;
      return user;
    } on Exception catch (e) {
      log('Error in SupabaseAuthService.signInWithEmail: ${e.toString()}');
      throw Exception('فشل في تسجيل الدخول.');
    }
  }

  Future <void> signInWithGoogle() async {
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        scopes : 'openid email profile',
      );
     
    } on Exception catch (e) {
      log('Error in SupabaseAuthService.signInWithGoogle: ${e.toString()}');
      throw Exception('فشل في تسجيل الدخول باستخدام جوجل.');
    }
  }

  Future <void> signInWithFacebook() async {
    try {
      await supabase.auth.signInWithOAuth(
        OAuthProvider.facebook,
        scopes : 'openid email profile',
      );
     
    } on Exception catch (e) {
      log('Error in SupabaseAuthService.signInWithFacebook: ${e.toString()}');
      throw Exception('فشل في تسجيل الدخول باستخدام فيسبوك.');
    }
  }

  
}
