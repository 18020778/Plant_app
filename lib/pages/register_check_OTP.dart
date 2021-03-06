import 'package:first_app/pages/register_name.dart';
import 'package:first_app/pages/register_password.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class regOTP extends StatefulWidget {
  String phoneNumber;
  @override
  _regOTPState createState() => _regOTPState();
  regOTP({this.phoneNumber});
}

class _regOTPState extends State<regOTP> {

  String verificationCode;
  String smsCode;
  var _controler = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyPhone();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text('Nhập mã xác minh',
            style: TextStyle(fontSize: 22),),
          backgroundColor: Colors.green[900],
        ),
        body: Column(
            children: [
              SizedBox(height: 70,),
              Text('Mã xác minh',
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
                child: TextField(
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, letterSpacing: 32),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    border: InputBorder.none
                  ),
                  autofocus: true,
                  maxLength: 6,
                  controller: _controler,
                  onChanged: (val){
                    smsCode = val;
                    print(widget.phoneNumber);
                    if(val.length == 6){
                      FirebaseAuth.instance.currentUser().then((user){
                        if(user!=null){
                        }else{
                          _controler.clear();
                          _passOTP();

                        }
                      });
                    }
                  },

                ),
              ),

            ]
        )
    );
  }
  // verify
  Future <void> verifyPhone() async {
    // Automatic handling of the SMS code on Android devices
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential credential) async{

      await FirebaseAuth.instance.signInWithCredential(credential);
    };


    // Handle failure events : invalid phoneNumber, ...
    final PhoneVerificationFailed phoneVerificationFailed = (AuthException exception){
      print("${exception.message}");

    };

    // Handle when a code has been sent to the sevice form Firebase
    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]){
      this.verificationCode = verId;
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId){
      this.verificationCode = verId;
    };


    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }
  _passOTP(){
    AuthCredential phoneAuthCredential = PhoneAuthProvider.getCredential(verificationId: verificationCode, smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).then((user)=> Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => regName()),
    )).catchError((e)=>print(e));
  }
}
