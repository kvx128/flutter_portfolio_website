
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web_app/components/services/authentication.dart';
import 'package:web_app/components/my_outline_button.dart';
import 'package:web_app/sections/blog/components/blank_blog_card.dart';
import '../../../constants.dart';
import 'private_blog_display.dart';

class SignedInUserPage extends StatefulWidget {
  SignedInUserPage({
    Key key,
  }) : super(key: key);

  @override
  _SignedInUserPageState createState() => _SignedInUserPageState();
}

class _SignedInUserPageState extends State<SignedInUserPage> {
  final AuthService _auth = AuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();

  //trial
  // html.File _cloudFile;
  // var _fileBytes;
  // Future<void> getMultipleInfos() async {
  //   var mediaData = await ImagePickerWeb.getImageInfo;
  //   String mimeType = mime(Path.basename());
  // }
  // Future uploadImageToFirebase() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   File image = new File(pickedFile.path);

  //   var reference = FirebaseStorage.instance
  //       .ref()
  //       .child('last_image/car5'); // Modify this path/string as your need
  //   StorageUploadTask uploadTask = reference.putFile(photo);
  //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  //   taskSnapshot.ref.getDownloadURL().then(
  //         (value) => print("Download URL: $value"),
  //       );
  // }
  // trial ends

  XFile photo;

  Widget userImage = Image.asset("assets/images/people.png");

  void setUserImage(XFile pic) {
    userImage = (pic != null)
        ? Image.network(
            photo.path,
            fit: BoxFit.fill,
          )
        : Image.asset(
            "assets/images/user.png",
            fit: BoxFit.fill,
          );
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  photo = await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    setUserImage(photo);
                  });
                  print(photo.path);
                },
                child: Container(
                  height: kDefaultPadding * 8,
                  width: kDefaultPadding * 8,
                  child: ClipRRect(
                    child: userImage,
                    borderRadius: BorderRadius.circular(kDefaultPadding * 4),
                  ),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding * 4),
                child: Column(
                  children: [
                    Text(
                      "@${_firebaseAuth.currentUser.displayName}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(height: 1.5),
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    // Text("Articles Liked")
                    MyOutlineButton(
                      text: "Sign Out",
                      press: () async {
                        await _auth.signOut();
                      },
                      imageSrc: "assets/images/signout.png",
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            child: Divider(
              height: kDefaultPadding,
              color: Color(0xFFA600FF).withOpacity(0.25),
              thickness: kDefaultPadding * 0.5,
            ),
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlankBlogCard(), Center(child: Container(width: 350,
                child: Text("Click the center of the card to start typing and then press add button to upload a new blog", style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(height: 1.5),softWrap: true,),
              ))
            ],
          ),
          SizedBox(height: kDefaultPadding*2,),
          PrivateBlogDisplay()
        ],
      ),
    );
  }
}
