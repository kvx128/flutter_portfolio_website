// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:web_app/models/CustomUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> uploadImage(html.File file) async {
    //File file = File(filePath);
    if (_auth.currentUser != null) {
      Reference firebaseStorageReference = FirebaseStorage.instance
          .ref()
          .child("profilepics/${_auth.currentUser.uid}.jpg");
      UploadTask task = firebaseStorageReference.putBlob(
          //await file.readAsBytes()
          // await filePath,
          SettableMetadata(
        contentType: "image/jpeg",
        //customMetadata: {"picked-file-path": filePath}
      ));
      Future.value(task);
    }
  }

  // Future<void> uploadFile(html.File file) async {
  //   try {
  //     await FirebaseStorage.instance
  //         .refFromURL("urlFromStorage")
  //         .child("profilepics/${_auth.currentUser.uid}.jpg")
  //         .putFile(file);
  //   } on FirebaseException catch (e) {
  //     // e.g, e.code == 'canceled'
  //     print("error: $e");
  //   }
  // }

  // create user obj based on firebase user
  CustomUser _userFromFirebaseUser(User user) {
    return user != null
        ? CustomUser(
            uid: user.uid,
            displayName: user.displayName,
            photoURL: user.photoURL)
        : null;
  }

  // auth change user stream
  Stream<CustomUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // // sign in anonymous
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User user = result.user;
  //     return user;
  //     // return _userFromFirebseUser(user!);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // // sign in or register with email and password
  // Future signInEmail(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //       try {
  //         UserCredential userCredential = await _auth
  //             .createUserWithEmailAndPassword(email: email, password: password);
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'weak-password') {
  //           print('The password provided is too weak.');
  //         } else if (e.code == 'email-already-in-use') {
  //           print('The account already exists for that email.');
  //         }
  //       } catch (e) {
  //         print(e);
  //       }
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(user);
      return user;
    } catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print(e.toString());
      }
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(user);
      await user.updateDisplayName(displayName);
      await user.updatePhotoURL(
          "https://firebasestorage.googleapis.com/v0/b/portfolio-and-blog-website.appspot.com/o/user.png?alt=media&token=cf299478-1449-4959-8a91-9237a301cefe");
      // create a new document for the user with the uid
      //await DatabaseService(uid: user.uid).updateUserData('0','new crew member', 100);
      await FirebaseFirestore.instance.collection("userData").doc(user.displayName);
      print(user.displayName);
      print(user.photoURL);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
