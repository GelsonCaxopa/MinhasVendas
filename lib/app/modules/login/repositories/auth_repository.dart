import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<User> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<User> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final User user = (await _auth.signInWithCredential(credential)).user;

    return user;
  }

  @override
  Future<String> getToken() {
    throw UnimplementedError();
  }

  @override
  Future getEmailLogin() {
    throw UnimplementedError();
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }
}
