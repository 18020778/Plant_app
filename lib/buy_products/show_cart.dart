import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class showCart extends StatefulWidget {
  @override
  _showCartState createState() => _showCartState();
}

class _showCartState extends State<showCart> {

  @override
  Widget build(BuildContext context) {
    bool _checkBox = false;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
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
              child: Column(
                children: [
                  ColoredBox(
                    color: Color(0xFFE6FFEE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text('ShopName', style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text("Xóa", style: TextStyle(
                                color: Colors.black54, fontSize: 16),))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _checkBox,
                        onChanged: (bool value) {
                          setState(() {
                            _checkBox = value;
                          });
                        },
                        activeColor: Color(0xFF488B66),
                        checkColor: Colors.white,
                      ),
                      Image.asset("assets/bonsai.jpg",  width: 100, fit: BoxFit.cover,),
                    Column(
                      children: [
                        Text("NameProduct",
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text("đ"+"50000", style: TextStyle(color: Color(0xFF488B66),fontSize: 16),),
                        
                      ],
                    )
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
