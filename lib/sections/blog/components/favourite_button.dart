import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({
    Key key,
  }) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isLiked = false;
  IconData _icon = Icons.favorite_border_outlined;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
          if (isLiked) {
            _icon = Icons.favorite;
          } else {
            _icon = Icons.favorite_border;
          }
        });
      },
      icon: Icon(_icon),
    );
  }
}
