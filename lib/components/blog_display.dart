import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/models/Article.dart';
import 'package:web_app/sections/blog/components/blog_card.dart';

// ignore: must_be_immutable
class BlogDisplay extends StatelessWidget {
  BlogDisplay({Key key}) : super(key: key);
  CollectionReference blogs = FirebaseFirestore.instance.collection("blogs");
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: (kDefaultPadding * 2),
                        mainAxisSpacing: (kDefaultPadding * 2)),
                    itemBuilder: (BuildContext context, int index) {
                      var doc = snapshot.data.docs[index];
                      return BlogCard(
                        article: Article(
                          id: doc["id"],
                          name: doc["name"],
                          body: doc["body"],
                          userPic: doc["userPic"],
                          colorCode: colors[doc["id"] % 3],
                        ),
                      );
                    },
                    itemCount: snapshot.data.docs.length,
                  ),
                )
              ],
            ),
          );
        });
  }
}
