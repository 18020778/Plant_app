import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/account/editEmail.dart';
import 'package:first_app/account/utlis.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'EditName.dart';
import 'package:intl/intl.dart';
import 'package:first_app/account/EditPhone1.dart';
class EditInfo extends StatefulWidget {
  User user;
  @override
  _EditInfoState createState() => _EditInfoState();
  EditInfo({this.user});
}

class _EditInfoState extends State<EditInfo> {
  User user;
  @override
  void initState() {
    super.initState();
    this.userName = widget.user.getUserName();
    this.gender = widget.user.getGender();
    if(widget.user.getDob() !=null ){
      this.dateTime = DateTime.fromMillisecondsSinceEpoch(widget.user.getDob().seconds*1000);
    }
    this.phoneNumber = widget.user.phoneNumber;
    this.email = widget.user.email;
  }
  String userName =  "";
  String gender =  "";
  String phoneNumber = "";
  String email = "";
  File imageFile;
  final picker = ImagePicker();
  DateTime dateTime = DateTime.now();
  String value = "Thiết lập ngay";

  var index = 1;
  static List<String> gentles = ['Nam', 'Nữ', 'Khác'];

  _openGallery(BuildContext context) async {
    PickedFile picture = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (picture != null) {
        imageFile = File(picture.path);
      }
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Chọn hình đại diện"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Chọn sẵn có"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      })
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF407C5A), //change your color here
        ),
        title: Text(
          "Chỉnh sửa thông tin",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {
                print("this is "+widget.user.getUid());
                widget.user.setEmail(this.email);
                widget.user.setGender(this.gender);
                widget.user.setUserName(this.userName);
                widget.user.setDob(Timestamp.fromDate(this.dateTime));
                print(widget.user.getEmail());
                Database().updateUser(widget.user);
                
                Navigator.pop(context);
              },
              child: Text(
                "Lưu",
                style: TextStyle(fontSize: 20, color: Color(0xFF407C5A)),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(4281755726), Color(4284859275)],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: (screenWidth - 100) / 2, vertical: 50),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //image: _decideImage(),
                        image: imageFile != null
                            ? FileImage(imageFile)
                            : AssetImage("assets/account.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(50)),
                child: FlatButton(
                  onPressed: () {
                    _showChoiceDialog(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 73),
                    height: 27,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150))),
                    child: Text(
                      "Sửa",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () async {
                     final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditName()));
                     setState(() {
                       this.userName =  result;
                     });
                  },
                  child: Row(
                    children: [
                      Text(
                        "Tên đăng nhập",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Spacer(),
                      Text(
                        ""+this.userName,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () => Utils.showSheet(context,
                          child: _displayGentle(), onClicked: () {
                    setState(() {
                       gender= gentles[index];
                    });
                        Navigator.pop(context);
                      }),
                  child: Row(
                    children: [
                      Text(
                        "Giới tính",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Spacer(),
                      Text(
                        '$gender' == "" ? "Thiết lập ngay" :  '$gender',
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(color: Colors.black12),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Row(
                children: [
                  Text(
                    "Địa chỉ",
                    style: TextStyle(fontSize: 20),
                  ),
                  new Spacer(),
                  Text(
                    "Thiết lập ngay",
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () => Utils.showSheet(context,
                          child: _displayDate(), onClicked: () {
                        setState(() {
                          value = DateFormat('dd/MM/yyyy').format(dateTime);
                        });
                        Navigator.pop(context);
                       // print(value);
                      }),
                  child: Row(
                    children: [
                      Text(
                        "Ngày sinh",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Spacer(),
                      Text(
                          (widget.user.getDob() == null) ? "Thiết lập ngay" :
                        DateFormat('dd/MM/yyyy').format(this.dateTime),
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )),
            ),
            // Container(
            //   height: 1,
            //   decoration: BoxDecoration(color: Colors.grey),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: FlatButton(
            //       onPressed: () {
            //         // Navigator.push(context,
            //         //     MaterialPageRoute(builder: (context) => EditPhone()));
            //       },
            //       child: Row(
            //         children: [
            //           Text(
            //             "Điện thoại",
            //             style: TextStyle(fontSize: 20),
            //           ),
            //           new Spacer(),
            //           Text(
            //             this.phoneNumber,
            //             style: TextStyle(color: Colors.black54, fontSize: 18),
            //           ),
            //           Icon(Icons.arrow_forward_ios)
            //         ],
            //       )),
            // ),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () async {
                    final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditEmail()));
                    setState(() {
                      this.email =  result;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Spacer(),
                      Text(
                        this.email,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(color: Colors.black12),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Thay đổi mật khẩu",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayDate() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1920,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime
              ),
        ),
      );

  Widget _displayGentle() => SizedBox(
        height: 120,
        child: CupertinoPicker(
          itemExtent: 30,
          diameterRatio: 0.9,
          looping: false,
          onSelectedItemChanged: (index) => setState(() => this.index = index),
         children: Utils.modelBuilder<String>(gentles, (index, gentle) {
            return Text(
              gentle,
              style: TextStyle(color: Colors.black, fontSize: 20),
            );
          }),
        ),
      );
}
