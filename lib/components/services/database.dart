import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_app/models/Article.dart';

class DatabaseService {
  final CollectionReference blogCollection =
      FirebaseFirestore.instance.collection("blogs");
  var _auth = FirebaseAuth.instance.currentUser.displayName;

  // Blog Functions
  Future<void> addData(Article blogData) async {
    FirebaseFirestore.instance.collection("blogs").add({
      "id": blogData.id,
      "name": blogData.name,
      "body": blogData.body,
      "userPic": blogData.userPic,
      "color": blogData.colorCode
    }).catchError((e) => print(e));
  }

  Future<void> addDataPvt(Article blogData) async {
    if(_auth !=  null){
      var pvtBlog = FirebaseFirestore.instance
          .collection("userData")
          .doc(_auth)
          .collection("pvtBlogs")
          .add({
        "id": blogData.id,
        "name": blogData.name,
        "body": blogData.body,
        "userPic": blogData.userPic,
        "color": blogData.colorCode
      }).catchError((e) => print(e));
    }
  }

  getData() async {
    return await blogCollection.snapshots();
  }
}
