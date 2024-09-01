import 'package:firebase_auth/firebase_auth.dart';

import 'apple_auth.dart';
import 'facebook_auth.dart';
import 'google_auth.dart';

enum LoginProvider {
  google,
  facebook,
  apple,
}

abstract class IAuth {
  late FirebaseAuth auth = FirebaseAuth.instance;

  Future<dynamic> login();

  Map<String, dynamic> getUserData(User? user);
}

class AuthService {
  IAuth getAuth(LoginProvider provider) {
    switch (provider) {
      case LoginProvider.google:
        return GoogleAuthImpl();
      case LoginProvider.facebook:
        return FacebookAuthImpl();
      case LoginProvider.apple:
        return AppleAuthImpl();
      default:
        throw Exception('Unsupported login provider');
    }
  }

  Future<void> login(
      LoginProvider provider, Function(Map<String, dynamic>) onUserData) async {
    IAuth auth = getAuth(provider);
    User? user = await auth.login();
    if (user != null) {
      Map<String, dynamic> userData = auth.getUserData(user);
      onUserData(userData);
    }
  }
}


mixin AuthUserData {
  Map<String, dynamic> getUser(LoginProvider provider, User? user) {
    return {
      'provider': provider,
      'name': user?.displayName,
      'email': user?.email,
      'phoneNumber': user?.phoneNumber,
      'photoURL': user?.photoURL,
      'refreshToken': user?.refreshToken,
      'uid': user?.uid,
    };
  }
}