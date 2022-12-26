import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRespositoryProvider = Provider((ref) {
  return AuthRepository(auth: FirebaseAuth.instance);
});

class AuthRepository{
  final FirebaseAuth auth;
  
  AuthRepository({required this.auth});

/// singIn With Firebase 
///
  Future<bool> singInWithFirebase(String email,String password)  async{
    try {
     final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
     );
     } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
     }
    } catch (e) {
     print(e);
     return false;
    }
    return true;
  }

/// singOut Method
/// 
  Future singOut()async{
    auth.signOut();
  }

}