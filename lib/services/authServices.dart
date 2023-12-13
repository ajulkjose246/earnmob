import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google SIgnin
  signInWithGoogle() async {
    //sign i process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain auth details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create new credintial
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
