import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider((_) => AuthStateNotifier());

class AuthStateNotifier extends StateNotifier<User?> {
  AuthStateNotifier() : super(FirebaseAuth.instance.currentUser) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((maybeUser) => state = maybeUser);
  }

  void setUser(User? user) {
    state = user;
  }
}
