import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_chat/app/service/auth/auth_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthImpl extends IAuth with AuthUserData {

  @override
  Future<Map<String, dynamic>> getUserData(User? user) async {
    return await getUser(LoginProvider.facebook, user);
  }

  @override
  Future login() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    final UserCredential userCredential =
        await auth.signInWithCredential(oauthCredential);
    return userCredential.user;
  }
}
