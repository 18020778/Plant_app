import 'file:///C:/flutter/Plant_app-main/lib/account/account_page.dart';
import 'package:first_app/show_products_page/body_home_0.dart';
import 'package:first_app/show_products_page/type_of_trees_1.dart';
import 'package:first_app/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'liked_page.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  var _currentIndex = 0;
  var bodyTabs = [
    bodyHome(),
    WalletPage(),
    TypeOfTrees(),
    LikedPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    var height = (_currentIndex == 0 ? 117.0 : 100.0);
    return Scaffold(
      /*appBar: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: appBarTabs[_currentIndex],
      ),*/
      body: bodyTabs[_currentIndex],
      bottomNavigationBar: BottomNavBar(),

    );
  }

  BottomNavBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              color: Color(4281755726),
              size: 27.0,
            ),
            activeIcon: Icon(
            FontAwesomeIcons.home,
            color: Color(0xFF488B66),
            size: 27.0,
            ),
            title: Text(
              'Trang chủ',
              style: TextStyle(
                  color: Color(0xFF488B66)
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.wallet,
              color: Color(4281755726),
              size: 27.0,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.wallet,
              color: Color(0xFF488B66),
              size: 27.0,
            ),
            title: Text(
              'Ví điện tử',
              style: TextStyle(
                  color: Color(0xFF488B66)
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidNewspaper,
              color: Color(4281755726),
              size: 27.0,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.solidNewspaper,
              color: Color(0xFF488B66),
              size: 27.0,
            ),
            title: Text(
              'Cẩm nang',
              style: TextStyle(
                  color: Color(0xFF488B66)
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidHeart,
              color: Color(4281755726),
              size: 27.0,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.solidHeart,
              color: Color(0xFF488B66),
              size: 27.0,
            ),
            title: Text(
              'Đã thích',
              style: TextStyle(
                  color: Color(0xFF488B66)
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidUser,
              color: Color(4281755726),
              size: 27.0,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.solidUser,
              color: Color(0xFF488B66),
              size: 27.0,
            ),
            title: Text(
              'Tài khoản',
              style: TextStyle(
                  color: Color(0xFF488B66)
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        });
  }
}


