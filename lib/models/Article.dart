
class Article {
  final String name, body, userPic;
  final int id;
  final int colorCode;
  Article({this.name, this.body, this.userPic, this.id, this.colorCode});
}

// List of demo Articles
// ignore: non_constant_identifier_names
List<Article> articles = [
  Article(
    id: 1,
    name: "Ronald Thompson",
    body: body,
    userPic: "assets/images/people.png",
    colorCode: 0xFFFFF3DD,
  ),
  Article(
    id: 2,
    name: "Ronald Thompson",
    body: body,
    userPic: "assets/images/people.png",
    colorCode: 0xFFD9FFFC,
  ),
  Article(
    id: 3,
    name: "Ronald Thompson",
    body: body,
    userPic: "assets/images/people.png",
    colorCode: 0xFFFFE0E0,
  ),
];

String body =
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua enim ad minim veniam.';
