import 'package:first_app/login_reg_pages/register_numberPhone.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class regWel extends StatefulWidget {
  @override
  _regWelState createState() => _regWelState();
}

class _regWelState extends State<regWel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(4281755726), Color(4284859275)],
            ),
          ),
          child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Image.asset('assets/logo.png', width: 180, height: 180,),
                SizedBox(height: 50),
                Text('Welcome to Little Garden!',
                  style: TextStyle(
                    fontFamily: 'AkayaTelivigala',
                    color: Colors.lime,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30,),
                Text('Chúng tôi sẽ giúp bạn tạo tài khoản mới \nsau vài bước dễ dàng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 20, height: 1.5),
                ),
                SizedBox(height: 140,),
                Flexible(
                      child: RaisedButton(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(130, 12, 130, 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => regNumberPhone()));
                          //(context);
                        },
                        child: Text("TIẾP",
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                      )
                  ),
                SizedBox(height: 110,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bãn đã là thành viên?  ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => loginPage()));
                      },
                      child: Text("Đăng nhập",
                        style: TextStyle(color: Colors.lime, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ]
          ),
        )
    );
  }
}