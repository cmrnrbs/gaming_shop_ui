import 'package:flutter/material.dart';
import 'package:gaming_shop_ui/classes/item.dart';
import 'package:gaming_shop_ui/colors.dart';
import 'package:gaming_shop_ui/constants.dart';
import 'package:gaming_shop_ui/widgets/star_list.dart';

class DetailScreen extends StatefulWidget {
  Item selecteditem;
  BuildContext mycontext;
  DetailScreen({this.selecteditem, this.mycontext});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Widget> thumbs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double itemSpace = (MediaQuery.of(widget.mycontext).size.width -
            (horizontalSpace * 2) -
            (4 * 72)) /
        3;

    for (var i = 0; i < widget.selecteditem.images.length; i++) {
      thumbs.add(Row(
        children: [
          Container(
            width: 72,
            height: 72,
            child: Center(
              child: Image.asset(
                'assets/' + widget.selecteditem.images[i] + '.png',
              ),
            ),
            decoration: BoxDecoration(
              border:
                  i == 0 ? Border.all(width: 1.4, color: purpleColor) : null,
              borderRadius: BorderRadius.circular(15),
              color: thumbnailBg,
            ),
          ),
          i == widget.selecteditem.images.length - 1
              ? SizedBox()
              : SizedBox(
                  width: itemSpace,
                )
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            color: purpleColor,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/logo.png',
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalSpace, vertical: verticalSpace),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 112.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/' + widget.selecteditem.itemBg + '.png',
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thumbs.length != 0
                          ? Row(
                              children: thumbs,
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.selecteditem.title,
                        style: TextStyle(
                            fontFamily: 'Montserrat-SemiBold', fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      StarList(
                        rate: widget.selecteditem.rate,
                        starColor: yellowColor,
                        emptyStarColor: unselectedMenuColor,
                        iconSize: 24,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.selecteditem.overview,
                        style: TextStyle(
                            fontFamily: 'Montserrat-Medium',
                            fontSize: 13,
                            height: 1.8),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: horizontalSpace,
                  right: horizontalSpace,
                  bottom: verticalSpace),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + widget.selecteditem.price.toInt().toString(),
                      style: TextStyle(
                          fontSize: 30,
                          color: titleDarkColor,
                          fontFamily: 'Montserrat-Bold')),
                  Container(
                    width: 182,
                    height: 56,
                    child: Center(
                      child: Text(
                        'Add to Card',
                        style: TextStyle(
                            fontFamily: 'Montserrat-SemiBold',
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: orangeColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
