
import 'package:first_app/show_products_page/TreeItem.dart';
import 'package:first_app/show_products_page/group_of_trees_0.dart';
import 'package:first_app/show_products_page/search_box_012.dart';
import 'package:first_app/show_products_page/type_of_trees_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    return Scaffold(
    appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.16),
    child: homeAppBar(),
    ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 10,),
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
                ListTypeOfTrees(),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Nhóm cây",
                    style: TextStyle(
                        color: Color(4281755650),
                        fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                ),
                ListGroupOfTrees(
                  groupItems: ["Hoa cúc", "Hoa Lan", "Hoa cúc", "Hoa Hồng",  "Bonsai"],
                  groupImages: [
                    'assets/cuc.jpg',
                    'assets/lan.jpg',
                    'assets/cuc.jpg',
                    'assets/hong.jpg',
                    'assets/bonsai.jpg'
                  ]
                ),
                SizedBox(height: 10,),
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
                  width: screenWidth*0.96,
                  height: screenWidth * 0.66,
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      TreeItem(name: "Xương rồng", image: "assets/xuong_rong.jpg", price: "20k", amount: '2', isFavorited: false, location: "Hà Nội"),
                      TreeItem(name: "Xương rồng", image: "assets/xuong_rong.jpg", price: "20k", amount: '2', isFavorited: false, location: "Hà Nội"),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
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
                  width: screenWidth*0.96,
                  height: screenWidth * 0.66,
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      TreeItem(name: "Xương rồng", image: "assets/xuong_rong.jpg", price: "20k", amount: '2', isFavorited: false, location: "Hà Nội"),
                      TreeItem(name: "Xương rồng", image: "assets/xuong_rong.jpg", price: "20k", amount: '2', isFavorited: false, location: "Hà Nội"),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
class homeAppBar extends StatefulWidget {
  @override
  _homeAppBarState createState() => _homeAppBarState();
}

class _homeAppBarState extends State<homeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(4281755726), Color(4284859275)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 32,
                              top: 15,
                            ),
                            child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Hi ",
                                        style: TextStyle(fontSize: 26,
                                            fontWeight: FontWeight.w700)
                                    ),
                                    TextSpan(
                                        text: "Customer",
                                        style: TextStyle(fontSize: 26,
                                            fontWeight: FontWeight.w700)
                                    ),
                                    TextSpan(
                                        text: "!",
                                        style: TextStyle(fontSize: 26,
                                            fontWeight: FontWeight.w700)
                                    ),
                                  ],
                                )
                            ),
                          )
                      ),
                      IconButton(
                        padding: EdgeInsets.only(top: 15, right: 15),
                        icon: Icon(FontAwesomeIcons.bell, color: Colors.white,),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SearchBox(text: 'Litte Gardent',
                    onChanged: (value) {},
                  )
                ]
            ),
          ),
        ));
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

class ListTypeOfTrees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(viewportFraction: 0.6, initialPage: 1);
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < bannerItems.length; i++) {
      var bannerView = Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TypeOfTrees()));
          },
          child: Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(4291751385),
                              offset: Offset(0, 140),
                              spreadRadius: 0,
                              blurRadius: 100.0),
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2.0,
                              blurRadius: 2.0),
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
                  padding: EdgeInsets.all(8),
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

