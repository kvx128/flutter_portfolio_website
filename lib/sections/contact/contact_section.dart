import 'package:flutter/material.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/components/social_buttons.dart';
import 'package:web_app/constants.dart';

import 'components/social_card.dart';
// TODO: adjust padding
class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Teaming Up",
            color: Color(0xFF07E24A),
          ),
          SizedBox(height: kDefaultPadding*2,),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocalCard(
                color: Color(0xFFD9FFFC),
                iconSrc: "assets/images/call.png", //"assets/images/skype.png",
                name: 'Phone',
                press: () {},
                value: "+91-9407826128",
              ),
              SocalCard(
                color: Color(0xFFE4FFC7),
                iconSrc:
                    "assets/images/mail.png", //"assets/images/whatsapp.png",
                name: 'Mail',
                press: () {},
                value: "kvx128@gmail.com",
              ),
              SocalCard(
                color: Color(0xFFE8F0F9),
                iconSrc:
                    "assets/images/house.png", //"assets/images/messanger.png",
                name: 'Location',
                press: () {},
                value: "Bhopal, MP",
              ),
              SocalCard(
                color: Color(0xFFFFE0E0),
                iconSrc:
                    "assets/images/twitterIcon.png", //"assets/images/messanger.png",
                name: 'Twitter',
                press: () {},
                value: "@kvx128",
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          // ContactForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButtons(
                  color: Color.fromARGB(175, 255, 102, 102) //Color(0xFFA600FF),
                  ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding * 6,
          ),
          Text(
            "© 2021 Keshav Vishwakarma",
            style: TextStyle(color: Color.fromARGB(255, 147, 196, 255)),
          )
        ],
      ),
    );
  }
}
