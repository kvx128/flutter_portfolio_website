import 'package:flutter/material.dart';
import 'package:web_app/components/default_button.dart';
import 'package:web_app/components/my_outline_button.dart';
import 'package:web_app/constants.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding*2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text:
                      "I'm enthusiastic learner and passionate about about software development & innovations. A Flutter developer, Python/C++ programmer, machine learning enthusiast based in India.",
                ),
              ),
              ExperienceCard(numOfExp: "1"),
              Expanded(
                child: AboutSectionText(
                    text:
                        "I have been developing Android/IOS Apps for just over 6 months now and all of these apps have majorly been in Flutter. This portfolio website is my first time playing around with flutter web. Right now I'm in my Second year of undergraduate degree at Birla Institue of Technology and Science, Pilani doing my Engineering in Mechanical."),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: "assets/images/hand.png",
                text: "Hire Me!",
                press: () {},
              ),
              SizedBox(width: kDefaultPadding * 1.5),
              DefaultButton(
                imageSrc: "assets/images/download.png",
                text: "Download CV",
                press: () {
                  js.context.callMethod('open', [
                    'https://firebasestorage.googleapis.com/v0/b/portfolio-and-blog-website.appspot.com/o/Keshav%20Vishwakarma%20Resume.pdf?alt=media&token=df059325-c30c-4ef8-b095-22b00f983486'
                  ]);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
