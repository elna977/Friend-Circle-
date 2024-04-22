
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  static final FirebaseAuth _auth =FirebaseAuth.instance; 
  static Future  signInWithEmailAndPassowrd(String email,String password) async {
   try{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
   }
   catch(e){
    print(e.toString());
      }
  }
   static Future  signUpWithEmailAndPassowrd(String email,String password) async {
   try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
   }
   catch(e){
    print(e.toString());
      }
  }

 static Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
}