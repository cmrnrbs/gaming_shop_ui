import 'package:flutter/material.dart';

class Item {
  String title;
  String itemBg;
  double rate;
  double price;
  Color itemColor;
  String overview;
  List<String> images = const [];
  Item(
      {this.title,
      this.itemBg,
      this.rate,
      this.price,
      this.itemColor,
      this.images,
      this.overview});
}
