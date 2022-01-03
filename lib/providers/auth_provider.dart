import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ユーザ名保持のProvider
final userNameProvider = StateProvider<String?>((ref) => null);

/// 認証状態保持のProvider
final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier());

/// 認証状態の保持を行うStateNotifier
class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState(FirebaseAuth.instance.currentUser)) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      state = AuthState(user);
    });
  }
}

class AuthState {
  const AuthState(this.user);

  final User? user;
}
