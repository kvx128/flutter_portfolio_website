import 'package:flutter/material.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/models/Skill.dart';

import 'components/skill_card.dart';

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: Color(0xFFFF0000),
            title: "Skills",
            subTitle: "My Strong Arenas",
          ),
          SizedBox(height: kDefaultPadding*2,),
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    skills.length, (index) => SkillCard(index: index)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
