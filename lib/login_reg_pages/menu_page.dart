
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RaisedButton(
        onPressed: (){
          FirebaseAuth.instance.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> loginPage()));
        },
        child: Text("Sign Out"),
      ),
    );
  }
}