import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bodyHome extends StatefulWidget {
  @override
  _bodyHomeState createState() => _bodyHomeState();
}

class _bodyHomeState extends State<bodyHome> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    PageController controller =
        PageController(viewportFraction: 0.4, initialPage: 1);

    return SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(
                    "Thể loại",
                    style: TextStyle(
                        color: Color(4281755650),
                        fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                ),
                TypeOfTrees(),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Tìm kiếm hàng đầu",
                    style: TextStyle(
                        color: Color(4281755650),
                        fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: screenWidth * 0.54,

                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      TreeItem(screenHeight, screenWidth, "Xương rồng",
                          "assets/xuong_rong.jpg", "20k", "Việt Nam"),
                      TreeItem(screenHeight, screenWidth, "Sen đá",
                          "assets/sen_da.jpg", "20k", "Việt Nam"),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Gợi ý cho bạn",
                    style: TextStyle(
                        color: Color(4281755650),
                        fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: screenWidth * 0.54,
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      TreeItem(screenHeight, screenWidth, "Xương rồng",
                          "assets/xuong_rong.jpg", "20k", "Việt Nam"),
                      TreeItem(screenHeight, screenWidth, "Sen đá",
                          "assets/sen_da.jpg", "20k", "Việt Nam"),
                    ],
                  ),
                ),
              ]),
        );
  }
}

var bannerItems = [
  'Cây phong thủy',
  'Cây trong nhà',
  'Cây ngoài trời',
  'Cây văn phòng',
  'Cây loại to',
  'Cây sen đá',
  'Cây thủy sinh',
  'Cây dây leo',
  'Xương rồng cảnh'
];
var bannerImages = [
  'assets/cay_phong_thuy.PNG',
  'assets/cay_trong_nha.jpg',
  'assets/cay_ngoai_troi.jpg',
  'assets/cay_van_phong.PNG',
  'assets/cay_loai_to.jpg',
  'assets/sen_da.jpg',
  'assets/cay_thuy_sinh.jpg',
  'assets/cay_day_leo.jpg',
  'assets/xuong_rong.jpg'
];

class TypeOfTrees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(viewportFraction: 0.6, initialPage: 1);
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerItems.length; i++) {
      var bannerView = Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2.0, 4.0),
                          blurRadius: 10.0,
                          spreadRadius: 1.0)
                    ],
                ),
                ),

              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Image.asset(
                    bannerImages[i],
                    fit: BoxFit.cover,
                  )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[i],
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Có ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        TextSpan(
                          text: '... ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        TextSpan(
                          text: 'sản phẩm',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 8 / 16,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: banners,
        ));
  }
}

Widget TreeItem(screenHeight, screenWidth, name, image, price, origin) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          child: Stack(fit: StackFit.expand, children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    color: Color(4291751385),
                    offset: Offset(0, 140),
                    spreadRadius: 0,
                    blurRadius: 100.0),
              ]),
          margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: screenWidth * 0.6,
                height: screenHeight * 0.2,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Image.asset(
                  image,
                  width: screenWidth * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                            Text(name,
                            style: TextStyle(
                            fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            ),
                            Text(
                            price,
                            style: TextStyle(
                              color: Colors.green[900],
                            ),
                          ),
                      ],
                    ),
                    Text(
                      origin,
                      style: TextStyle(color: Colors.green[900]),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ])));
}
