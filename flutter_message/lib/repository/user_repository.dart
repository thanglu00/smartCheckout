//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttermessage/object_transfer/inforUser.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _facebookLogin;
  String check = "";

  UserRepository({FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignIn,
    FacebookLogin facebookLogin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _facebookLogin = facebookLogin ?? FacebookLogin();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    await _firebaseAuth.signInWithCredential(credential);
    check = "GG";
    return _firebaseAuth.currentUser();
  }

  Future<FirebaseUser> signInWithFaceBook() async {
    FacebookLoginResult facebookLoginResult =
    await _facebookLogin.logIn(['email']);
    final accessToken = facebookLoginResult.accessToken.token;
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final facebookAuthCred =
      FacebookAuthProvider.getCredential(accessToken: accessToken);
      await _firebaseAuth.signInWithCredential(facebookAuthCred);
      check = "FB";
      return _firebaseAuth.currentUser();
    }
  }

  Future<void> signOut() async {
    if (check == "GG") {
      return Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } else if (check == "FB") {
      return Future.wait([
        _firebaseAuth.signOut(),
        _facebookLogin.logOut(),
      ]);
    }
  }

  Future<bool> isSignIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).displayName;
  }

  Future<String> getEmail() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  final firestoreInstance = Firestore.instance;

//  checkExistPhoneNumber() async {
//    String phoneNumber =
//        (await FirebaseAuth.instance.currentUser()).phoneNumber;
//    if (phoneNumber != null) return true;
//    return false;
//  }
//
//  void updatePhoneIfNotExist(String phone) async {
//    String user = (await FirebaseAuth.instance.currentUser()).email;
//    firestoreInstance.collection("users").document(user).updateData({
//      "phone": "$phone",
//    }).then((_) {
//      print("success add phone!");
//    });
//  }

  void checkAccountExist() async {
    String user = (await FirebaseAuth.instance.currentUser()).email;
    try {
      await firestoreInstance.collection("users").document("$user").get().then((value) {
        if (value.exists)
          print("Value exist in database");
        else
         addUserToFirebase();
      });
    }catch(e) {
      addUserToFirebase();
    }
    //if(checkExist == false){addUserToFirebase();}

  }



void addUserToFirebase() async {
  String user = (await FirebaseAuth.instance.currentUser()).email;
  String userName = (await FirebaseAuth.instance.currentUser()).displayName;
  String phoneNumber =
      (await FirebaseAuth.instance.currentUser()).phoneNumber;
  firestoreInstance.collection("users").document(user).setData({
    "name": "$userName",
    "gmail": "$user",
    "phone": "$phoneNumber",
  }).then((_) {
    print("success add user!");
  });
}
//  Future<String> getIdUser() async{
//    return (_googleSignIn.clientId);
//  }
}
