import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: FaIcon(FontAwesomeIcons.github,
                size: 40.0, color: color //Colors.white,
                ),
            onPressed: () {
              js.context.callMethod('open', ['https://github.com/kvx128']);
            }),
        SizedBox(
          width: 30.0,
        ),
        IconButton(
            icon: FaIcon(FontAwesomeIcons.linkedin,
                size: 40.0, color: color //Colors.white,
                ),
            onPressed: () {
              js.context.callMethod('open',
                  ['https://www.linkedin.com/in/keshav-vishwakarma-7a4559ab/']);
            }),
        SizedBox(
          width: 30.0,
        ),
        IconButton(
            icon: FaIcon(
              FontAwesomeIcons.reddit,
              color: color, //Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              js.context
                  .callMethod('open', ['https://www.reddit.com/user/kvx128']);
            }),
        SizedBox(
          width: 30.0,
        ),
        IconButton(
            icon: FaIcon(FontAwesomeIcons.instagram,
                size: 40.0, color: color //Colors.white,
                ),
            onPressed: () {
              js.context.callMethod(
                  'open', ['https://www.instagram.com/___bruce.wayne___/']);
            }),
        SizedBox(
          width: 30.0,
        ),
        IconButton(
            icon: FaIcon(FontAwesomeIcons.discord,
                size: 40.0, color: color //Colors.white,
                ),
            onPressed: () {
              js.context.callMethod(
                  'open', ['https://top.gg/user/834852790693134416']);
            }),
      ],
    );
  }
}
