// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:web_app/components/services/authentication.dart';
import 'package:web_app/components/default_button.dart';

import '../../../constants.dart';

class SignedOutUserPage extends StatefulWidget {
  const SignedOutUserPage({Key key}) : super(key: key);

  @override
  _SignedOutUserPageState createState() => _SignedOutUserPageState();
}

class _SignedOutUserPageState extends State<SignedOutUserPage> {
  // ignore: non_constant_identifier_names
  Widget register_or_signIn = Container();

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
          Text(
            "Sign In to explore",
            style: Theme.of(context).textTheme.headline5.copyWith(height: 1.5),
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/password.png",
                    text: "Login",
                    press: () {
                      setState(() {
                        register_or_signIn = AuthenticationForm();
                      });
                    },
                  ),
                ),
              ),
              Center(
                child: FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/domain.png",
                    text: "Register",
                    press: () {
                      setState(() {
                        register_or_signIn = RegistrationForm();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          register_or_signIn
        ],
      ),
    );
  }
}

class AuthenticationForm extends StatefulWidget {
  AuthenticationForm({
    Key key,
  }) : super(key: key);

  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final AuthService _auth = AuthService();

  String email, pswd;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        // before Wrap
        // spacing: kDefaultPadding * 2.5,
        // runSpacing: kDefaultPadding * 1.5,
        children: [
          // SizedBox(
          //   width: 470,
          //   child: TextFormField(
          //     onChanged: (value) {},
          //     decoration: InputDecoration(
          //       labelText: "Your Name",
          //       hintText: "Enter Your Name",
          //     ),
          //   ),
          // ),
          // TODO: Add image from storage
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  pswd = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
              ),
            ),
          ),
          // SizedBox(
          //   width: 470,
          //   child: TextFormField(
          //     onChanged: (value) {},
          //     decoration: InputDecoration(
          //       labelText: "Project Budget",
          //       hintText: "Select Project Budget",
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   // height: 300,
          //   // TextField by default cover the height, i tryed to fix this problem but i cant
          //   child: TextFormField(
          //     onChanged: (value) {},
          //     decoration: InputDecoration(
          //       labelText: "Description",
          //       hintText: "Write some description",
          //     ),
          //   ),
          // ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/signin.png",
                text: "Sign In!",
                press: () async {
                  print("$email $pswd");
                  dynamic result =
                      await _auth.signInWithEmailAndPassword(email, pswd);
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in');
                    //print(result.uid);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  RegistrationForm({
    Key key,
  }) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final AuthService _auth = AuthService();

  String email, pswd, firstName, lastname;

  uploadImage() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // InkWell(
        //   onTap: 
        //   child: Container(
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.circular(kDefaultPadding * 4),
        //         child: userImage),
        //     height: kDefaultPadding * 8,
        //     width: kDefaultPadding * 8,
        //     decoration: BoxDecoration(
        //         // image: DecorationImage(
        //         //     image: AssetImage("assets/images/people.png"),
        //         //     fit: BoxFit.cover),
        //         shape: BoxShape.circle),
        //   ),
        // ),
        // SizedBox(
        //   height: kDefaultPadding * 2,
        // ),
        Form(
          child: Wrap(
            spacing: kDefaultPadding * 2,
            runSpacing: kDefaultPadding * 1,
            children: [
              SizedBox(
                width: 470,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      firstName = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "Enter your first name",
                  ),
                ),
              ),
              SizedBox(
                width: 470,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      lastname = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "Enter your last name",
                  ),
                ),
              ),
              SizedBox(
                width: 470,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    hintText: "Enter your email address",
                  ),
                ),
              ),
              SizedBox(
                width: 470,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      pswd = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding * 2),
              Center(
                child: FittedBox(
                  child: DefaultButton(
                    imageSrc: "assets/images/signin.png",
                    text: "Sign Up!",
                    press: () async {
                      print("$email $pswd \n$firstName $lastname");
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, pswd, "$firstName $lastname");
                      if (result == null) {
                        print('error signing in');
                      } else {
                        print('signed in');
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
