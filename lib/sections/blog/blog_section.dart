import 'package:flutter/material.dart';
import 'package:web_app/components/blog_display.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/constants.dart';


class BlogSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      // height: 1500,
      constraints: BoxConstraints(maxWidth: 1110,),
      child: Column(
        children: [
          SectionTitle(
            title: "Blog",
            subTitle: "Articles that taught us a lot",
            color: Color(0xFF00B1FF),
          ),
          SizedBox(height: kDefaultPadding),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: List.generate(
          //     articles.length,
          //     (index) => BlogCard(index: index),
          //   ),
          // ),
          BlogDisplay()
        ],
      ),
    );
  }
}
