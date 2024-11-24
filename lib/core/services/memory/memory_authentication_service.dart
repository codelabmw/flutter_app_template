import 'dart:math';

import '../../contracts/services/authentication_service.dart';
import '../../models/user.dart';

class MemoryAuthenticationService implements AuthenticationService {
  User? _currentUser;

  final List<User> _registry = [
    User(uuid: 'uuid-000000', verified: true, email: 'user@example.com'),
  ];

  MemoryAuthenticationService() {
    _currentUser = _registry.first;
  }

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
  Future verify({dynamic options}) async {
    await Future.delayed(const Duration(seconds: 2));
    _currentUser = User.fromMap(_currentUser!.copyWith(verified: true).toMap());
  }

  @override
  Future sendVerificationNotification({options}) {
    // TODO: implement sendVerificationNotification
    throw UnimplementedError();
  }
}
