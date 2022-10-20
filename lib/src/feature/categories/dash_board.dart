import 'package:flutter/material.dart';
import 'package:makeup/src/feature/categories/categories_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex = 0;

  List<Widget> _children() => [
        CategoriesScreen(),
        Container(),
        Container(),
        Container(),
      ];

  List<BottomNavModel> navBarsItems() {
    return [
      BottomNavModel(
        icon: Image.asset(
          'assets/home.png',
          // color: Theme.of(context).primaryColor,
          height: 30.0,
          width: 30.0,
        ),
        inactiveIcon: Image.asset(
          'assets/home.png',
          height: 30.0,
          width: 30.0,
        ),
        title: "home",
      ),
      BottomNavModel(
        icon: Image.asset(
          'assets/menu.png',
          // color: Theme.of(context).primaryColor,
          height: 30.0,
          width: 30.0,
        ),
        inactiveIcon: Image.asset(
          'assets/menu.png',
          height: 30.0,
          width: 30.0,
        ),
        title: ("Rate List"),
      ),
      BottomNavModel(
        icon: Image.asset(
          'assets/shopping.png',
          // color: Theme.of(context).primaryColor,
          height: 30.0,
          width: 30.0,
        ),
        inactiveIcon: Image.asset(
          'assets/shopping.png',
          height: 30.0,
          width: 30.0,
        ),
        title: ("Book Now"),
      ),
      BottomNavModel(
        icon: Image.asset(
          'assets/person.png',
          // color: Theme.of(context).primaryColor,
          height: 30.0,
          width: 30.0,
        ),
        inactiveIcon: Image.asset(
          'assets/person.png',
          height: 30.0,
          width: 30.0,
        ),
        title: ("Profile"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children()[selectedIndex],
      bottomNavigationBar: Container(
        height: 70.0,
        color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < navBarsItems().length; i++)
              GestureDetector(
                onTap: () {
                  selectedIndex = i;
                  setState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    selectedIndex == i
                        ? navBarsItems()[i].icon
                        : navBarsItems()[i].inactiveIcon,
                    Text(
                      navBarsItems()[i].title,
                      style: TextStyle(
                          // fontFamily: Constant().font,
                          color: selectedIndex == i
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class BottomNavModel {
  final Widget icon;
  final Widget inactiveIcon;
  final String title;

  BottomNavModel(
      {required this.icon, required this.inactiveIcon, required this.title});
}
