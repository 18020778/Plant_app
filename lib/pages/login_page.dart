import 'package:first_app/pages/register_welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green[900],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset('assets/logo.png', width: 180, height: 170,),
            SizedBox(height: 20),
            Text('Welcome to Little Garden!',
                style: TextStyle(
                    fontFamily: 'AkayaTelivigala',
                    color: Colors.lime,
                    fontSize: 28,
                ),
            ),
              SizedBox(height: 40,),
              Container(
                child: Column(
                  children: <Widget>[
                    _textInput(hint: "Number Phone", icon: Icons.phone),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 40, right: 30),
              alignment: Alignment.centerRight,
                child: Text("Forgot your password?",
                style: TextStyle(
                  color: Colors.white70
                ),)
            ),
            Flexible(
                child: SizedBox(
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(150, 12, 150, 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    onPressed: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => ShakeWidget()));
                    },
                    child: Text("LOGIN",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ),
              ),
            SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text ("Don't have an account?  ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => regWel()));
                  },
                    child: Text ("Registor",
                    style: TextStyle(color: Colors.lime, fontSize: 20),
                    ),
                )
              ]
                )
      ]
                  )
      )
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.white),
            left: BorderSide(width: 1.0, color: Colors.white),
          )
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 20, color: Colors.white70),
          prefixIcon: Icon(icon,color: Colors.white,),
        ),

      ),
    );
  }

}
