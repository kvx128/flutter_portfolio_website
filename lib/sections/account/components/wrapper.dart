import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/models/CustomUser.dart';
import 'package:web_app/sections/account/components/signedin_user_section.dart';
import 'package:web_app/sections/account/components/signedout_user_section.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    // return either the SignedIn or SignedOut widget
    if (user == null) {
      return SignedOutUserPage();
    } else {
      return SignedInUserPage();
    }
  // return SignedInUserPage();
  }
}
