import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:live_chat/app/service/auth/auth_service.dart';

class FacebookAuthImpl extends IAuth with AuthUserData {

  @override
  Map<String, dynamic> getUserData(User? user) {
    return getUser(LoginProvider.facebook, user);
  }

  @override
  Future login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      final UserCredential userCredential =
          await auth.signInWithCredential(facebookAuthCredential);
      return userCredential.user;
    }
    return null;
  }
}
