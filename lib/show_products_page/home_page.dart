import 'package:first_app/show_products_page/body_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight*0.19),
          child: _homeAppBar(context),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            bodyHome(),
        ]
        )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _homeAppBar(BuildContext context) {
    return Container(
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
                                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)
                                        ),
                                        TextSpan(
                                            text: "Customer",
                                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)
                                        ),
                                        TextSpan(
                                            text: "!",
                                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)
                                        ),
                                      ],
                                    )
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: (){},
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 170,
                                    top: 15,
                                  ),
                                  child: Image.asset('assets/alert.png', width: 35, height: 35,),
                                ),
                              )
                          )
                        ],
                      ),
                      SearchBox(
                        onChanged: (value) {},
                      )
                    ]
                ),
              ),
            )

    );
  }
}


class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    Key key, this.onChanged,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [BoxShadow(
            color: Colors.green[900].withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
          ]
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Image.asset('assets/Search_Icon.svg.png', width: 25,),
          hintText: "Little Garden",
          hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)
        ),
      ),
    );
  }
}


