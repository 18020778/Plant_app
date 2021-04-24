
import 'dart:io';
import 'package:first_app/account/utlis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'EditName.dart';
import 'package:intl/intl.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class EditInfo extends StatefulWidget {
  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {

  File imageFile;
  final picker = ImagePicker();

  _openGallery(BuildContext context)  async{
    PickedFile picture = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(picture != null) {
        imageFile = File(picture.path);
      }
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context)  async{
    var picture = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Chọn hình đại diện"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: Text("Chọn sẵn có"),
                onTap: (){
                  _openGallery(context);
                },
              ),
              SizedBox(height: 8,),
              GestureDetector(
                  child: Text("Camera"),
                  onTap: (){
                    _openCamera(context);
                  }
              )
            ],
          ),
        ),
      );
    });
  }

  DateTime dateTime = DateTime.now();
  String value = "Thiết lập ngay";
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF407C5A), //change your color here
        ),
        title: Text("Chỉnh sửa thông tin",
          style: TextStyle(color: Colors.black, fontSize: 22),),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text("Lưu",
                style: TextStyle(fontSize: 20, color: Color(0xFF407C5A)),)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children: [
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
                            fit: BoxFit.cover
                        ),
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
                                bottomRight: Radius.circular(150)
                            )
                        ),
                        child: Text("Sửa", textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ),)
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditName()));
                  },
                  child: Row(
                    children: [
                      Text("Tên", style: TextStyle(fontSize: 20),),
                      new Spacer(),
                      Text("Thiết lập ngay/Linh",
                        style: TextStyle(color: Colors.black54, fontSize: 18),),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Row(
                children: [
                  Text("Tên đăng nhập", style: TextStyle(fontSize: 20),),
                  new Spacer(),
                  Text("NguyenHongLinh",
                    style: TextStyle(color: Colors.black54, fontSize: 18),),
                ],
              ),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(color: Colors.black12),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(onPressed: () {},
                  child: Row(
                    children: [
                      Text("Giới tính", style: TextStyle(fontSize: 20),),
                      new Spacer(),
                      Text("Thiết lập ngay/Nữ",
                        style: TextStyle(color: Colors.black54, fontSize: 18),),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () =>
                      Utils.showSheet(context,
                          child: _displayDate(),
                          onClicked: () {
                            setState(() {
                              value = DateFormat('dd/MM/yyyy').format(dateTime);
                            });
                            Navigator.pop(context);
                            print(value);
                          }),
                  child: Row(
                    children: [
                      Text("Ngày sinh", style: TextStyle(fontSize: 20),),
                      new Spacer(),
                      Text('$value', style: TextStyle(color: Colors.black54, fontSize: 18),) ,
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(onPressed: () {},
                  child: Row(
                    children: [
                      Text("Điện thoại", style: TextStyle(fontSize: 20),),
                      new Spacer(),
                      Text("098457323",
                        style: TextStyle(color: Colors.black54, fontSize: 18),),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(onPressed: () {},
                  child: Row(
                    children: [
                      Text("Email", style: TextStyle(fontSize: 20),),
                      new Spacer(),
                      Text("Thiết lập ngay",
                        style: TextStyle(color: Colors.black54, fontSize: 18),),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
              ),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(color: Colors.black12),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Thay đổi mật khẩu", style: TextStyle(fontSize: 20),),
                      new Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
              ),
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
          setState(() => this.dateTime = dateTime),
    ),
  );
}