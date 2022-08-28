import 'package:flutter/material.dart';

// TODO change to my image
class PersonPic extends StatelessWidget {
  const PersonPic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(maxWidth: 639, maxHeight: 860),
      height: 500,
      child: Image.asset(
        "assets/images/person.png",
        //changes
        fit: BoxFit.contain,
      ),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}
