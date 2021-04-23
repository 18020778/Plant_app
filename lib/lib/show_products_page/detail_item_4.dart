import 'package:first_app/buy_products/show_cart_0.dart';
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
      appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          elevation: 0.0,
          bottomOpacity: 0.0,
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(4281755726), Color(0xFF488B66)],
            ),
          )),
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
      body: Container(
          child: Stack(children: <Widget>[
        Column(
          children: [
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
                  boxShadow: [
                    BoxShadow(
                        color: Color(4291751385),
                        offset: Offset(0, 20),
                        spreadRadius: 4,
                        blurRadius: 20.0),
                  ]),
              child: _appBarDetail(context),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cách chăm sóc",
                  style: TextStyle(
                    fontFamily: "Merriweather",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ngày tưới 2 lần, phơi ra nắng, thích xvnjcgd fdg  s fsd  sf  fd sf asf a f f f sd  s  sf s f sf  fg df  fg d gs hfdjhgjd f bd  d d g d gf sf df sf  f sdf  f s fs f s f df  f d d f g fd  d  e fw ẻ we ",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 15,
          child: Row(
            children: <Widget>[
              Container(
                width: screenWidth * 0.5,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Đặc tả",
                        style: TextStyle(
                          fontFamily: "Merriweather",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tuổi thọ: " + "1-3 năm",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Xuất xứ: " + "Pháp",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Thời gian chăm sóc: " + "nhiều",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        )),
                    /*Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ngày trồng: " + "20/10/2020",
                          style: TextStyle(fontSize: 16, height: 1.5),
                        )),*/
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF488B66), Color(4284859275)],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/sun.png",
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            "  " + "Phơi dưới nắng",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/droplet.png",
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              "  " + "20-30ml nước",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/temperature.png",
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            " " + "Dưới 30 độ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ])),
    );
  }

  Widget _appBarDetail(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
        child: Row(children: [
      Container(
          width: screenWidth * 0.39,
          margin: EdgeInsets.only(right: 8.2),
          child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "NameTree\n NameTree",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: "Merriweather",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Giá",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "20000" + "đ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Chiều cao",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "150" + " cm",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Thể loại",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Cây trong nhà",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Column(
                              children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: RaisedButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                child: Text(
                                  'Mua ngay',
                                  style: TextStyle(fontSize: 16),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => showCart()));
                                },
                                splashColor: Colors.black,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(children: <Widget>[
                                FlatButton(
                                  minWidth: 70,
                                  padding: EdgeInsets.all(2.0),
                                  color: Colors.white,
                                      child: Image.asset(
                                        "assets/message.png",
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      onPressed: () {},
                                    ),
                                    FlatButton(
                                      minWidth: 60,
                                      color: Colors.white,
                                      child: Image.asset(
                                        "assets/addToCart.png",
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      onPressed: () {
                                        showAlert(context);
                                      },
                                    ),
                                  ]),
                            ),
                          ]),
                        ]),
                  ),
          ]),
          )),
          Container(
                    width: screenWidth * 0.59,
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

  showAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Image.asset("assets/checkIcon.png", width: 50, height: 50,),
      content: Text("Sản phẩm đã được thêm vào giỏ hàng"),
    );
    showDialog(
      context: context,
      builder: (BuildContext) {
        return alert;
      }
    );
  }
}
