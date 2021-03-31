import 'package:flutter/material.dart';

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  void _setRatingAsFour() {
    setState(() {
      _rating = 4;
    });
  }

  void _setRatingAsFive() {
    setState(() {
      _rating = 5;
    });
  }

  Widget build(BuildContext context) {
    print(_rating);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            rateBox(1, _setRatingAsOne),
            rateBox(2, _setRatingAsTwo),
            rateBox(3, _setRatingAsThree),
            rateBox(4, _setRatingAsFour),
            rateBox(5, _setRatingAsFive),
          ],
        ),
      ),
    );
  }

  Widget rateBox(int num, Function x) {
    return IconButton(
      icon: (_rating >= num
          ? Icon(
              Icons.star,
              size: 16,
            )
          : Icon(
              Icons.star_border,
              size: 16,
            )),
      color: Colors.red[500],
      onPressed: x,
      iconSize: 16,
    );
  }
}
