import 'package:flutter/material.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/models/Institutions.dart';

import 'components/education_card.dart';

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: Color(0xFFFF0000),
            title: "Education",
            subTitle: "Places where I have been Taught",
          ),
          SizedBox(height: kDefaultPadding*4,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(institutions.length - 1,
                    (index) => EducationCard(index: index)),
              ),
              SizedBox(height: 20),
              EducationCard(
                index: 2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
