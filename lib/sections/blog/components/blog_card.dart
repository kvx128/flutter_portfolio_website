import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_app/models/Article.dart';
import 'package:web_app/sections/blog/components/favourite_button.dart';

import '../../../constants.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({Key key, this.article
      //this.index,
      })
      : super(key: key);
  final Article article;
  // final int index;

  @override
  _BlogCardState createState() => _BlogCardState(article);
}

class _BlogCardState extends State<BlogCard> {
  Duration duration = Duration(milliseconds: 200);
  bool isHover = false;
  Article _article;
  _BlogCardState(this._article);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
          color: Color(
              _article.colorCode), //Color(articles[widget.index].colorCode),
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
                        image: (_article.userPic != null)
                            ? NetworkImage(_article.userPic)
                            : AssetImage("assets/images/user.png"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      child: Text(
                        _article.body,
                        //articles[widget.index].body,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _article.name,
                      //"Ronald Thompson",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    FavouriteButton()
                  ],
                ),
                SizedBox(height: kDefaultPadding )
              ],
            ),

      ),
    );
  }
}
