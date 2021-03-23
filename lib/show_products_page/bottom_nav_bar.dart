import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}
@override
class _BottomNavBarState extends State<BottomNavBar> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: (int value) {
        setState(() {
          _currentTab = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.home,
            color: Color(4281755726),
            size: 27.0,
          ),
          title: SizedBox.fromSize(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.wallet,
            color: Color(4281755726),
            size: 27.0,
          ),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.solidHeart,
            color: Color(4281755726),
            size: 27.0,
          ),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.solidUser,
            color: Color(4281755726),
            size: 27.0,
          ),
          title: SizedBox.shrink(),
        ),
      ],
    );
  }
}