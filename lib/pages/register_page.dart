import 'package:first_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  //Image.asset('assets/logo.png', width: 180, height: 180,),
                  SizedBox(height: 50),
                  Text('Welcome to Little Garden!',
                    style: TextStyle(
                      fontFamily: 'AkayaTelivigala',
                      color: Colors.lime,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        _textInput(hint: "Name", icon: Icons.account_circle),
                        _textInput(hint: "Number Phone",  icon: Icons.phone),
                        _textInput(hint: "Email", icon: Icons.email),
                        _textInput(hint: "Password", icon: Icons.vpn_key),
                        _textInput(hint: "Confirm Password", icon: Icons.vpn_key),
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Flexible(
                      child: SizedBox(
                          child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(130, 12, 130, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            onPressed: (){},
                            child: Text("REGISTER",
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          )
                      ),
                    ),
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text("Already a member?  ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
                            },
                          child: Text("Login now",
                                style: TextStyle(color: Colors.lime, fontSize: 20),
                              ),
                        ),
                    ],
                  ),
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
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 20, color: Colors.white70),
          prefixIcon: Icon(icon,color: Colors.white,),
        ),

      ),
    );
  }
}
