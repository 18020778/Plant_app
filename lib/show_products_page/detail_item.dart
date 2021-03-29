import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';

class DetailItem extends StatefulWidget {
  @override
  _DetailItemState createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(toolbarHeight: 60, centerTitle: true,
            elevation: 0.0,
            bottomOpacity: 0.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(4281755726), Color(0xFF488B66)],
                  ),
              )
            ),

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
        body: Column(children: <Widget>[
          Container(
              width: screenWidth,
              height: screenHeight * 0.46,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF488B66), Color(4284859275)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [BoxShadow(
                  color: Color(4291751385),
            offset: Offset(0, 20),
            spreadRadius: 4,
            blurRadius: 20.0),
    ]
              ),
                child: _appBarDetail(context),
            ),
        ]));
  }

  Widget _appBarDetail(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NameTree",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Giá",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "20000" + "đ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Chiều cao",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "150" + " cm",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Thể loại",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cây trong nhà",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RaisedButton(
                        textColor: Colors.black,
                        color: Colors.white,
                        splashColor: Colors.black,
                        child: Text("MUA NGAY", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                        onPressed: () {},
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),

                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RaisedButton(
                        textColor: Colors.black,
                        color: Colors.white,
                        child: Text("+ Thêm vào giỏ", style: TextStyle(fontSize: 16),),
                        onPressed: () {},
                        splashColor: Colors.black,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),

                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.6,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 320,
                    child: new Carousel(
                      boxFit: BoxFit.cover,
                      images: [
                        AssetImage('assets/cay_phong_thuy.PNG'),
                        AssetImage('assets/cay_trong_nha.jpg'),
                        AssetImage('assets/cay_ngoai_troi.jpg'),
                        AssetImage('assets/cay_phong_thuy.PNG'),
                        AssetImage('assets/cay_trong_nha.jpg'),
                        AssetImage('assets/cay_ngoai_troi.jpg'),
                      ],
                      autoplay: false,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 1000),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
