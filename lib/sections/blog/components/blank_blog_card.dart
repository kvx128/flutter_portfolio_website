import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_app/models/Article.dart';
import 'package:web_app/components/services/database.dart';

import '../../../constants.dart';

class BlankBlogCard extends StatefulWidget {
  const BlankBlogCard({
    Key key,
  }) : super(key: key);

  @override
  _BlankBlogCardState createState() => _BlankBlogCardState();
}

class _BlankBlogCardState extends State<BlankBlogCard> {
  Duration duration = Duration(milliseconds: 200);
  bool isHover = false;
  Widget widgetChanger = Container();
  String body;
  Article newArticle;
  DatabaseService dbs = DatabaseService();
  var _currentUser = FirebaseAuth.instance.currentUser.displayName;
  var _currentUserPic = FirebaseAuth.instance.currentUser.photoURL;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widgetChanger = Container(
            color: Colors.white,
            height: 320,
            width: 300,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                setState(() {
                  body = value;
                });
              },
              maxLines: 6,
              decoration: InputDecoration(
                labelText: "Post",
                hintText: "Express yourself to the world!",
              ),
            ),
          );
        });
      },
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.only(top: kDefaultPadding * 3),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0xFFFFE0E0),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(0, -55),
              child: AnimatedContainer(
                duration: duration,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 10),
                  boxShadow: [if (!isHover) kDefaultCardShadow],
                  image: DecorationImage(
                    image: AssetImage("assets/images/user.png"),
                  ),
                ),
              ),
            ),
            Expanded(
              // child: Text(
              //   articles[widget.index].review,
              //   style: TextStyle(
              //     color: kTextColor,
              //     fontSize: 18,
              //     fontWeight: FontWeight.w300,
              //     fontStyle: FontStyle.italic,
              //     height: 1.5,
              //   ),
              // ),
              child: Container(
                child: Center(child: widgetChanger),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/add4.png"),
                  fit: BoxFit.contain,
                )),
              ),
            ),
            SizedBox(height: kDefaultPadding),
            ElevatedButton(
                onPressed: () {
                  if (body !=null){
                    // print("${colors[Random().nextInt(3)]}");
                    // print(Article(
                    //     body: body,
                    //     id: 12,
                    //     name: "name",
                    //     userPic: "pic",
                    //     colorCode: colors[Random().nextInt(3)]));
                    dbs.addData(Article(
                        body: body,
                        id: 12,
                        name: _currentUser,
                        userPic: _currentUserPic,
                        colorCode: colors[Random().nextInt(3)]));
                    dbs.addDataPvt(Article(
                        body: body,
                        id: 12,
                        name: _currentUser,
                        userPic: _currentUserPic,
                        colorCode: colors[Random().nextInt(3)]));
                  }
                },
                child: Image.asset(
                  "assets/images/add4.png",
                  height: 20,
                ),
                // child: Icon(Icons.add,
                //   color: Color(0xFFFFE0E0),),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(0),
                    primary: Colors.white,
                    elevation: 20)),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
