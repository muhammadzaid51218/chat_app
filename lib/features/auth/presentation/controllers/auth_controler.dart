import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../routes/app_router.dart';
import '../../../../routes/app_routes.dart';
import 'auth_state.dart';

final authControllerProvider =
StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref);
});

class AuthController extends StateNotifier<AuthState> {
  final Ref ref;
  final _authService = AuthService();

  AuthController(this.ref) : super(const AuthState()) {
    _listenToAuthChanges();
  }

  // ✅ Listen to Firebase login/logout events
  void _listenToAuthChanges() {
    _authService.authStateChanges.listen((user) async {
      if (user == null) {
        state = const AuthState(user: null);
        _goToLogin();
      } else {
        final userModel = await _authService.getUserFromFirestore(user.uid);
        state = AuthState(user: userModel);
        _goToMain();
      }
    });
  }

  // ✅ Register user
  Future<void> registerWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final userModel = await _authService.registerWithEmailAndPassword(
        email,
        password,
        displayName,
      );
      if (userModel != null) {
        state = state.copyWith(user: userModel);
        _goToMain();
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // ✅ Sign in
  Future<void> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final userModel =
      await _authService.signInWithEmailAndPassword(email, password);
      if (userModel != null) {
        state = state.copyWith(user: userModel);
        _goToMain();
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // ✅ Sign out
  Future<void> signOut() async {
    await _authService.signOut();
    state = const AuthState(user: null);
    _goToLogin();
  }

  // ✅ Delete account
  Future<void> deleteAccount() async {
    try {
      state = state.copyWith(isLoading: true);
      await _authService.deleteAccount();
      state = const AuthState(user: null);
      _goToLogin();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // ✅ Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  // ✅ Navigation helpers
  void _goToMain() {
    final context =
        ref.read(routerProvider).routerDelegate.navigatorKey.currentContext;
    if (context != null) context.go(AppRoutes.main);
  }

  void _goToLogin() {
    final context =
        ref.read(routerProvider).routerDelegate.navigatorKey.currentContext;
    if (context != null) context.go(AppRoutes.login);
  }
}
