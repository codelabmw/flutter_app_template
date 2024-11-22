import '../../models/user.dart';

abstract interface class AuthenticationService {
  /// Sign in a user with their email address and password.
  Future signInWithEmail({required String email, required String password, bool remember = false});

  /// Sign up a new user with their email address and password.
  Future signUpWithEmail({required String email, required String password, String? name});

  /// Delete users current session.
  ///
  /// [all] determines whether should delete all current user sessions
  /// available.
  Future signout({bool all = false});

  /// Gets the current user in session or null if no user is found.
  Future<User?> getCurrentUser();

  /// Handles forgot password requests.
  Future forgotPassword({required String identifier});

  /// Handles user / account verification. This could be email or phone
  /// verification depending on application needs.
  Future verification();
}
