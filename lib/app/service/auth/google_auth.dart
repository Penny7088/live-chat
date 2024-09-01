import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_service.dart';

class GoogleAuthImpl extends IAuth with AuthUserData{
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Map<String, dynamic> getUserData(User? user) {

    return getUser(LoginProvider.google, user);
  }

  @override
  Future<dynamic> login() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await auth.signInWithCredential(credential);
    return userCredential.user;
  }

}