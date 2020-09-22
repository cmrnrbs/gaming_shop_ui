import 'package:flutter/material.dart';

//ignore: must_be_immutable
class StarList extends StatefulWidget {
  double iconSize;
  double rate;
  Color starColor;
  Color emptyStarColor;
  StarList({this.rate, this.iconSize, this.starColor, this.emptyStarColor});
  @override
  _StarListState createState() => _StarListState();
}

class _StarListState extends State<StarList> {
  List<Widget> stars = [];

  int fullRateCount = 0;
  int halfRateCount = 0;
  int emptyRateCount = 0;
  @override
  void initState() {
    // TODO: implement initState

    getStars().then((value) {
      setState(() {
        stars = value;
      });
    });
    super.initState();
  }

  Future<List<Widget>> getStars() async {
    List<Widget> _mywidgets = [];
    String _newRate = widget.rate.toString();
    if (_newRate.indexOf('.') != -1) {
      fullRateCount = int.parse(_newRate.split('.')[0]);
      double check = double.parse(_newRate) - (fullRateCount);
      if (check > 0.5)
        setState(() {
          fullRateCount++;
        });
      else {
        if (check > 0)
          setState(() {
            halfRateCount++;
          });
      }
    }
    emptyRateCount = 5 - (halfRateCount + fullRateCount);
    for (var i = 0; i < fullRateCount; i++)
      _mywidgets.add(
          Icon(Icons.star, size: widget.iconSize, color: widget.starColor));

    for (var i = 0; i < halfRateCount; i++)
      _mywidgets.add(Icon(
        Icons.star_half,
        size: widget.iconSize,
        color: widget.starColor,
      ));

    for (var i = 0; i < emptyRateCount; i++)
      _mywidgets.add(Icon(Icons.star,
          size: widget.iconSize, color: widget.emptyStarColor));

    return _mywidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stars,
    );
  }
}
