import 'package:flutter/material.dart';
import 'package:web_app/components/section_title.dart';
import 'package:web_app/sections/account/components/wrapper.dart';

import '../../constants.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({Key key}) : super(key: key);

  @override
  _AccountSectionState createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: kDefaultPadding * 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF).withOpacity(0.3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/recent_work_bg.png"),
        ),
      ),
      child: Column(
        children: [
          SectionTitle(
            title: "Account",
            subTitle: "Your Profile",
            color: Color(0xFFFFB100),
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Wrapper(),
        ],
      ),
    );
  }
}
