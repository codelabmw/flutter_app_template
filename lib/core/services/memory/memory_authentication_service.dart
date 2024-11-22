import '../../contracts/services/authentication_service.dart';
import '../../models/user.dart';

class MemoryAuthenticationService implements AuthenticationService {
  @override
  Future forgotPassword({required String identifier}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<User?> getCurrentUser() async {
    return null;
  }

  @override
  Future signInWithEmail({required String email, required String password, bool remember = false}) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future signUpWithEmail({required String email, required String password, String? name}) {
    // TODO: implement signUpWithEmail
    throw UnimplementedError();
  }

  @override
  Future signout({bool all = false}) {
    // TODO: implement signout
    throw UnimplementedError();
  }

  @override
  Future verification() {
    // TODO: implement verification
    throw UnimplementedError();
  }
}
