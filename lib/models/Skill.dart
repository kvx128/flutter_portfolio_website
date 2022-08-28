import 'package:flutter/material.dart';

class Skills {
  final int id;
  final String title, image;
  final Color color;

  Skills({this.id, this.title, this.image, this.color});
}

// For demo list of service
List<Skills> skills = [
  Skills(
    id: 1,
    title: "Flutter App Development", //"Graphic Design",
    image: "assets/images/app.png", //"assets/images/graphic.png",
    color: Color(0xFFD9FFFC),
  ),
  Skills(
    id: 2,
    title: "Flutter Web Development", //"Web Design",
    image: "assets/images/laptop.png", //  "assets/images/desktop.png",
    color: Color(0xFFE4FFC7),
  ),
  Skills(
    id: 3,
    title: "Machine Learning", //"UI Design",
    image: "assets/images/ai.png", //"assets/images/ui.png",
    color: Color(0xFFFFF3DD),
  ),
  Skills(
    id: 4,
    title: "Blockchain Design",
    image:
        "assets/images/database.png", //"assets/images/Intreaction_design.png",
    color: Color(0xFFFFE0E0),
  ),
];
