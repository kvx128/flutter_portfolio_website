import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/sections/about/about_section.dart';
import 'package:web_app/sections/account/account_section.dart';
import 'package:web_app/sections/blog/blog_section.dart';
import 'package:web_app/sections/contact/contact_section.dart';
import 'package:web_app/sections/education/education_section.dart';
import 'package:web_app/sections/recent_work/recent_work_section.dart';
import 'package:web_app/sections/skills/skills_section.dart';

import 'components/logo_blur_box.dart';
import 'components/person_pic.dart';

class TopSection extends StatefulWidget {
  @override
  _TopSectionState createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  //changes start
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "Blog",
    "About",
    "Skills",
    "Education",
    "Projects",
    "Contact",
    "Account"
  ];
  //changes end

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(maxHeight: 900, minHeight: 700),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/background.png"),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            width: 1200,
            child: Stack(
              children: [
                LogoAndBlurBox(size: size),
                Positioned(
                  bottom: 210,
                  right: 0,
                  child: PersonPic(),
                ),
                Positioned(
                  bottom: 0,
                  //child: Menu(),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
                    constraints: BoxConstraints(maxWidth: 1110),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [kDefaultShadow],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        menuItems.length,
                        (index) => buildMenuItem(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        changePage(selectedIndex)
      ],
    );
  }

  // changes
  Widget changePage(int key) {
    switch (key) {
      case 0:
        return BlogSection();
      case 1:
        return AboutSection();
      case 2:
        return SkillSection();
      case 3:
        return EducationSection();
      case 4:
        return RecentWorkSection();
      case 5:
        return ContactSection();
      case 6:
        return AccountSection();
    }
    return AboutSection();
  }

  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
            //Navigator.pushNamed(context, "/")
          });
        },
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: BoxConstraints(minWidth: 122),
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: TextStyle(fontSize: 20, color: kTextColor),
              ),
              // Hover
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom:
                    selectedIndex != index && hoverIndex == index ? -20 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
              // Select
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -2 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
            ],
          ),
        ),
      );
}
