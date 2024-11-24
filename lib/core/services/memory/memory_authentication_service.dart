import 'dart:math';

import '../../contracts/services/authentication_service.dart';
import '../../models/user.dart';

class MemoryAuthenticationService implements AuthenticationService {
  User? _currentUser;

  final List<User> _registry = [
    User(uuid: 'uuid-000000', verified: false, email: 'user@example.com'),
  ];

  @override
  Future forgotPassword({required String identifier}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<User?> getCurrentUser() async {
    return _currentUser;
  }

  @override
  Future signInWithEmail({required String email, required String password, bool remember = false}) async {
    await Future.delayed(const Duration(seconds: 2));

    _currentUser = _registry.firstWhere((User user) => user.email == email);
  }

  @override
  Future signUpWithEmail({required String email, required String password, String? name}) async {
    await Future.delayed(const Duration(seconds: 3));

    _registry.add(
      User(uuid: 'uuid- ${(Random().nextInt(1000))}', verified: false, email: email, name: name),
    );
  }

  @override
  Future signout({bool all = false}) async {
    await Future.delayed(const Duration(seconds: 2));
    _currentUser = null;
  }

  @override
  Future verification() {
    // TODO: implement verification
    throw UnimplementedError();
  }
}
