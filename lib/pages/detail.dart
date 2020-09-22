import 'package:flutter/material.dart';
import 'package:gaming_shop_ui/classes/item.dart';

class DetailScreen extends StatefulWidget {
  Item selecteditem;
  DetailScreen({this.selecteditem});
  
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
