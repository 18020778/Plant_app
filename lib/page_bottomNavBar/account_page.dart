import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: screenHeight*0.4,
          decoration: BoxDecoration(
            image: DecorationImage(image: ExactAssetImage("assets/bg_account.jpg"),
              fit: BoxFit.cover
          ),
            boxShadow: [BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 5
            )]
        ),
          child: Center(
            child: Column(
              children: [

              ],
            ),
          ),
        )
      ],
    );
  }
}
