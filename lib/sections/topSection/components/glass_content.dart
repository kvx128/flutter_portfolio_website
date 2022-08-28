import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:web_app/components/social_buttons.dart';

import '../../../constants.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          constraints:
              BoxConstraints(maxWidth: 1110, maxHeight: size.height * 0.7),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello There! I'm ",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white),
              ),
              Text(
                "Keshav \nVishwakarma",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    ">",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText("Flutter App Developer",
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 22.0),
                          speed: Duration(milliseconds: 100)),
                      TypewriterAnimatedText("Flutter Web Developer",
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 22.0),
                          speed: Duration(milliseconds: 100)),
                      TypewriterAnimatedText("Machine Learner",
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 22.0),
                          speed: Duration(milliseconds: 100)),
                      TypewriterAnimatedText("Python Programmer",
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 22.0),
                          speed: Duration(milliseconds: 100)),
                    ],
                    repeatForever: true,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SocialButtons(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
