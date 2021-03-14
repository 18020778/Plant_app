import 'package:flutter/material.dart';

class regPassword extends StatefulWidget {
  @override
  _regPasswordState createState() => _regPasswordState();
}

class _regPasswordState extends State<regPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text('Mật khẩu',
            style: TextStyle(fontSize: 22),),
          backgroundColor: Colors.green[900],
        ),
        body: Column(
            children: [
              SizedBox(height: 60,),
              Text('Nhập mật khẩu của bạn',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.fromLTRB(40, 0, 40, 25),
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.blue),
                    )
                ),
                child: TextFormField(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: ('Mật khẩu'),
                    hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ),
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
                    hintText: ('Nhập lại mật khẩu'),
                    hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
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

                    },
                    child: Text("HOÀN THÀNH",
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
