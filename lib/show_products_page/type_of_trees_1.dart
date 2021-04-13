import 'package:first_app/show_products_page/bottom_nav_bar_0.dart';
import 'package:first_app/show_products_page/group_of_trees_0.dart';
import 'package:first_app/show_products_page/search_box_012.dart';
import 'package:first_app/show_products_page/show_items_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'TreeItem.dart';

class TypeOfTrees extends StatefulWidget {
  @override
  _TypeOfTreesState createState() => _TypeOfTreesState();
}

class _TypeOfTreesState extends State<TypeOfTrees> {
  PageController controller =
      PageController(viewportFraction: 0.4, initialPage: 1);

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 75,
          title: SearchBox(text: 'NameTypeOfTree'),
          leadingWidth: 20,
          centerTitle: true,
          backgroundColor: Color(0xFF407C5A),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.bell,
                color: Colors.white,
                size: 27.0,
              ),
              onPressed: () {},
            )
          ]),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Nhóm cây",
              style: TextStyle(
                  color: Color(4281755650),
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
            ),
          ),
          ListGroupOfTrees(groupItems: [
            "Hoa Lan",
            "Hoa cúc",
            "Hoa Hồng",
            "Bonsai"
          ], groupImages: [
            'assets/lan.jpg',
            'assets/cuc.jpg',
            'assets/hong.jpg',
            'assets/bonsai.jpg'
          ]),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Top sản phẩm bán chạy",
              style: TextStyle(
                  color: Color(4281755650),
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
            ),
          ),
          Container(
            width: screenWidth * 0.96,
            height: screenWidth * 0.66,
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: [
                TreeItem(
                    name: "Xương rồng",
                    image: "assets/xuong_rong.jpg",
                    price: "20k",
                    amount: '2',
                    isFavorited: false,
                    location: "Hà Nội"),
                TreeItem(
                    name: "Xương rồng",
                    image: "assets/xuong_rong.jpg",
                    price: "20k",
                    amount: '2',
                    isFavorited: false,
                    location: "Hà Nội"),
              ],
            ),
          ),
          ShowItem(),
        ],
      )),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
