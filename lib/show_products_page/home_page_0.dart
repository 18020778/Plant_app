import 'package:first_app/show_products_page/body_home_0.dart';
import 'package:first_app/show_products_page/search_box_012.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_nav_bar_0.dart';

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
                          IconButton(
                            padding: EdgeInsets.only(top: 15, right: 15),
                              icon: Icon(FontAwesomeIcons.bell, color: Colors.white,),
                            onPressed: (){},
                          )
                        ],
                      ),
                      SearchBox(text: 'Litte Gardent',
                        onChanged: (value) {},
                      )
                    ]
                ),
              ),
            )

    );
  }
}




