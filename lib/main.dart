import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gaming_shop_ui/classes/item.dart';
import 'package:gaming_shop_ui/classes/pageitem.dart';
import 'package:gaming_shop_ui/pages/detail.dart';
import 'classes/menu.dart';
import 'colors.dart';
import 'constants.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/star_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Gaming Shop UI',
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Menu> myMenu = [
    Menu(title: 'Controllers', isSelected: true),
    Menu(title: 'Headsets', isSelected: false),
    Menu(title: 'Keyboards', isSelected: false),
    Menu(title: 'Speakers', isSelected: false),
    Menu(title: 'VR Accessories', isSelected: false)
  ];

  List<PageItem> myPageItems = [
    PageItem(iconString: 'home', isselected: true),
    PageItem(iconString: 'heart', isselected: false),
    PageItem(iconString: 'shopping', isselected: false),
    PageItem(iconString: 'user', isselected: false),
  ];

  List<Item> myItems = [
    Item(
        title: 'Dualshock 4 Red Camouflage',
        itemBg: 'orange',
        rate: 4,
        price: 60,
        images: ['black1', 'black2', 'black3', 'black4'],
        overview:
            'Unleash your color with the arrival of four new\nstyles. Each wireless controller comes loaded with\nthe same DUALSHOCK®4 features including touch\npad, motion sensors and built-in rechargeable\nbattery.',
        itemColor: purpleColor),
    Item(
        title: 'Dualshock 4 Midnight Blue',
        itemBg: 'blue',
        rate: 4,
        price: 55,
        images: ['black1', 'black2', 'black3', 'black4'],
        overview:
            'Unleash your color with the arrival of four new\nstyles. Each wireless controller comes loaded with\nthe same DUALSHOCK®4 features including touch\npad, motion sensors and built-in rechargeable\nbattery.',
        itemColor: lightWhiteColor),
    Item(
        title: 'Dualshock 4 Glacier White',
        itemBg: 'white',
        rate: 4,
        price: 50,
        images: ['black1', 'black2', 'black3', 'black4'],
        overview:
            'Unleash your color with the arrival of four new\nstyles. Each wireless controller comes loaded with\nthe same DUALSHOCK®4 features including touch\npad, motion sensors and built-in rechargeable\nbattery.',
        itemColor: lightWhiteColor),
    Item(
        title: 'Dualshock 4 Jet Black',
        itemBg: 'black',
        rate: 4,
        price: 50,
        images: ['black1', 'black2', 'black3', 'black4'],
        overview:
            'Unleash your color with the arrival of four new\nstyles. Each wireless controller comes loaded with\nthe same DUALSHOCK®4 features including touch\npad, motion sensors and built-in rechargeable\nbattery.',
        itemColor: lightWhiteColor)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: verticalSpace, horizontal: horizontalSpace),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 96 - 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Icon(Icons.menu), Icon(Icons.search)],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Welcome to\nPlaystation® Accessories',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'Montserrat-SemiBold'),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        height: 25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int index) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myMenu[index].title,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat-Medium',
                                          color: myMenu[index].isSelected
                                              ? orangeColor
                                              : unselectedMenuColor),
                                    ),
                                    myMenu[index].isSelected
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                width: 50,
                                                height: 4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: orangeColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(
                                            height: 8,
                                          )
                                  ],
                                ),
                                SizedBox(
                                  width: 12,
                                )
                              ],
                            );
                          },
                          itemCount: myMenu.length,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                selecteditem: myItems[index],
                                                mycontext: context,
                                              )));
                                },
                                child: ClipRRect(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: itemHeight,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Container(
                                                width: index == 0
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        1.5
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        1.7,
                                                height: itemHeight,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Container(
                                                        width: 52,
                                                        height: 46,
                                                        child: Center(
                                                          child: Image.asset(
                                                            'assets/add_card.png',
                                                            scale: 1.2,
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: orangeColor,
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20))),
                                                      ),
                                                    ),
                                                    index == 0
                                                        ? Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          30.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/logo.png',
                                                                width: 240,
                                                              ),
                                                            ))
                                                        : SizedBox(),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: myItems[index]
                                                        .itemColor)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14.0,
                                                horizontal: 20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1.5) /
                                                      1.9,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        myItems[index].title,
                                                        style: TextStyle(
                                                            color: index == 0
                                                                ? Colors.white
                                                                : titleDarkColor,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Montserrat-SemiBold'),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      StarList(
                                                        rate:
                                                            myItems[index].rate,
                                                        starColor: yellowColor,
                                                        emptyStarColor: index ==
                                                                0
                                                            ? Color(0xFF845EF7)
                                                                .withOpacity(.8)
                                                            : unselectedMenuColor,
                                                        iconSize: 24,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '\$' +
                                                            myItems[index]
                                                                .price
                                                                .toInt()
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: index == 0
                                                                ? Colors.white
                                                                : titleDarkColor,
                                                            fontFamily:
                                                                'Montserrat-Bold'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/' +
                                                      myItems[index].itemBg +
                                                      '.png',
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      ((MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.5) /
                                                          1.9) -
                                                      (horizontalSpace * 2) -
                                                      40,
                                                )
                                              ],
                                            ),
                                          )
                                          // Align(
                                          //   alignment: Alignment.center,
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment.end,
                                          //     children: [
                                          //       Image.asset(
                                          //         'assets/' +
                                          //             myItems[index].itemBg +
                                          //             '.png',
                                          //         width: 180,
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                        itemCount: myItems.length,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: pageItemSize,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: pageItemSpace),
                    child: GamingBottomNavigationBar(
                      selectedPageIndex: selectedIndex,
                      items: myPageItems,
                      mycontext: context,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: lightWhiteColor,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
