import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  const BottomNavBar({
    Key key,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 35),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    ),
          boxShadow: [ BoxShadow (
            offset: Offset(0, -7),
            blurRadius: 33,
            color: Color(0xFF6DAED9).withOpacity(0.11),
    )
        ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Image.asset("assets/home_on.png", width: 25,),
                onPressed: (){}),
            IconButton(
                icon: Image.asset("assets/weather.png", width: 25,),
                onPressed: (){}),
            IconButton(
                icon: Image.asset("assets/heart.png", width: 25,),
                onPressed: (){}),
            IconButton(
                icon: Image.asset("assets/account.png", width: 25,),
                onPressed: (){}),
          ],
      ),
    );
  }
}
