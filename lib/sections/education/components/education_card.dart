import 'package:flutter/material.dart';
import 'package:web_app/models/Institutions.dart';

import '../../../constants.dart';

class EducationCard extends StatefulWidget {
  // just press "Command + ."
  const EducationCard({
    Key key,
    this.index,
    this.press,
  }) : super(key: key);

  final int index;
  final Function press;

  @override
  _EducationCardState createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 320,
        width: 540,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(institutions[widget.index].image),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(institutions[widget.index].details.toUpperCase()),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(
                      institutions[widget.index].name,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(height: 1.5),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Text(
                      "View Details",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
