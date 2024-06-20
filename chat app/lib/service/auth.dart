import 'package:chatapplasttry/helper/helper.dart';
import 'package:chatapplasttry/service/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//----------------------------------------------------------------login
  Future loginWithEmailAndPassWord({
    required String email,
    required String password,
  }) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

//----------------------------------------------------------------------register
  Future registerUserWithEmailAndPassword({
    required String fullname,
    required String email,
    required String password,
  }) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        await DatabaseService(uid: user.uid)
            .saveUserData(fullname: fullname, email: email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

//----------------------------------------------------------------------------signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLOgedInStatus(isUserLoggedIn: false);
      await HelperFunctions.saveUserName(userName: '');
      await HelperFunctions.saveUseremail(userEmail: '');
      firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
