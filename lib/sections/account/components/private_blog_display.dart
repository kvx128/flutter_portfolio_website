import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/models/Article.dart';
import 'package:web_app/sections/blog/components/blog_card.dart';

var _currentUser = FirebaseAuth.instance.currentUser.displayName;

// ignore: must_be_immutable
class PrivateBlogDisplay extends StatelessWidget {
  PrivateBlogDisplay({Key key}) : super(key: key);
  CollectionReference blogs = FirebaseFirestore.instance.collection("userData").doc(_currentUser).collection("pvtBlogs");

  int index = -1;
  // int itemCount(AsyncSnapshot<QuerySnapshot> snapshot) {
  //   int number = 0;
  //   for (int index = 0; index < (snapshot.data.docs.length); index++) {
  //     if (snapshot.data.docs[index]["name"] == _currentUser) {
  //       number++;
  //     }
  //   }
  //   print(number);
  //   return number;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: blogs.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            //height: 1000,
            constraints: BoxConstraints(maxWidth: 1100, maxHeight: 1100),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: (kDefaultPadding * 1),
                        mainAxisSpacing: (kDefaultPadding * 1),),
                    itemBuilder: (BuildContext context, index) {
                      var doc = snapshot.data.docs[index];
                      if (doc["name"] == _currentUser) {
                        print("authorised: ${_currentUser}");
                        return BlogCard(
                          article: Article(
                            id: doc["id"],
                            name: doc["name"],
                            body: doc["body"],
                            userPic: doc["userPic"],
                            colorCode: colors[doc["id"] % 3],
                          ),
                        );
                      } else
                        return Container();
                    },
                    itemCount:
                        //itemCount(snapshot)
                        snapshot.data.docs.length,
                  ),
                )
              ],
            ),
          );
        });
  }
}
