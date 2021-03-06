import 'package:first_app/pages/register_check_OTP.dart';
import 'package:first_app/pages/register_name.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/login_page.dart';

class regNumberPhone extends StatefulWidget {
  @override
  _regNumberPhoneState createState() => _regNumberPhoneState();
}

class _regNumberPhoneState extends State<regNumberPhone> {
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Số điện thoại',
          style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.green[900],
      ),
      body: Column(
        children: [
          SizedBox(height: 70,),
          Text('Nhập số điện thoại của bạn',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          textAlign: TextAlign.center,),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 40, 40),
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.blue),
                )
            ),
            child: TextFormField(
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  hintText: ('Số điện thoại'),
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              autofocus: true,
              onChanged: (value){
                if(value[0] == "0"){
                  this.phoneNumber = "+84" + value.substring(1, value.length);
                }else
                  this.phoneNumber = value;
              },
            ),
          ),
          Flexible(
              child: RaisedButton(
                color: Colors.green[800],
                padding: EdgeInsets.fromLTRB(140, 12, 140, 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                onPressed: () {
                 // _verifyPhone();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>regOTP(phoneNumber: this.phoneNumber)));
                },
                child: Text("NEXT",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),),
              )
          ),
        ]
    )
    );
  }

}
