import 'package:flutter/material.dart';
import 'package:gaming_shop_ui/constants.dart';
import '../classes/pageitem.dart';
import '../colors.dart';

class GamingBottomNavigationBar extends StatefulWidget {
  int selectedPageIndex;
  List<PageItem> items = const [];
  BuildContext mycontext;
  GamingBottomNavigationBar(
      {this.selectedPageIndex, this.items, this.mycontext});
  @override
  _GamingBottomNavigationBarState createState() =>
      _GamingBottomNavigationBarState();
}

class _GamingBottomNavigationBarState extends State<GamingBottomNavigationBar> {
  List<Widget> pages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    double deviceWidth = MediaQuery.of(widget.mycontext).size.width;
    double itemSpace = (deviceWidth -
            (pageItemSpace * 2) -
            (horizontalSpace * 2) -
            (4 * pageItemSize)) /
        3;
    for (var i = 0; i < widget.items.length; i++) {
      pages.add(Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.items[i].isselected
                  ? Container(
                      height: 4,
                      width: pageItemSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: orangeColor),
                    )
                  : SizedBox(
                      height: 4,
                    ),
              Container(
                width: pageItemSize,
                height: 56,
                child: Center(
                  child: Image.asset(
                    'assets/' + widget.items[i].iconString + '.png',
                    color:
                        widget.items[i].isselected ? orangeColor : null,
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
          i != 3
              ? SizedBox(
                  width: itemSpace,
                )
              : SizedBox(
                  width: 0,
                )
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: pages,
    );
  }
}
