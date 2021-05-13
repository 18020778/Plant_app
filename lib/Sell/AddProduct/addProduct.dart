

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:first_app/Sell/AddProduct/components/transport.dart';
import 'package:first_app/Sell/AddProduct/components/specification.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct>{
  //final picker =ImagePicker();
  String title= '';
  String value;
  String description = '';
  String dropDownValue;
  double price=0;
  DateTime date=DateTime.now();
  bool enableFeature = false;
  final picker = ImagePicker();
  File imageFile;
  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (picture != null) {
        imageFile = File(picture.path);
      }
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
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
            title: Text("Thêm hình"),
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
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF407C5A),
        iconTheme: IconThemeData(
          color: Colors.yellow,
        ),
        title: Text(
          'Thêm sản phẩm',
          style: TextStyle(color: Colors.yellow, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    //image: DecorationImage(
                      //  image: imageFile != null
                        //    ? FileImage(imageFile)
                            //: AssetImage('assets/images/shoes2.png'),
                        //fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(0)
                ),
                child: FlatButton(
                  onPressed: () {
                      _showChoiceDialog(context);
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,),
                        Text ("Add",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                ),
              )
            ]),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Nhập tên sản phẩm',
                  labelText: 'Tên sản phẩm',
                  labelStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    hintStyle: TextStyle(fontSize: 18, color: Colors.green)
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    Row(
                      children:[
                        Icon(Icons.add_location),
                        Text(
                          ' Cách chăm sóc ',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color(0xFF407C5A),
                            ),
                          ),
                          //errorText: 'Bắt buộc phải nhập',

                          hintText: 'Nhập tại đây ',
                          hintStyle: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500) ),
                      style: TextStyle(fontSize: 20),
                      maxLines: 6,
                      onChanged: (text){
                        description=text;
                      },

                    ),
                  ]
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Specification()),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.assessment_sharp),
                    Expanded(
                      child:
                      Text(
                        ' Đặc tả cây',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.monetization_on_sharp),
                  Text(
                    ' Giá sản phẩm ',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  //
                  Expanded(
                    child: new TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.green,
                          hintText: 'Nhập ',
                          hintStyle: TextStyle(color: Colors.green, decoration: TextDecoration.underline, fontSize: 18) ),
                          textDirection: TextDirection.rtl,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 20),
                        inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                    ],
                    ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.monetization_on_sharp),
                  Text(
                    ' Chiều cao (cm) ',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  //
                  Expanded(
                    child: new TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.green,
                          hintText: 'Nhập ',
                          hintStyle: TextStyle(color: Colors.green, decoration: TextDecoration.underline, fontSize: 18) ),
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                        children:<Widget>[
                        Icon(Icons.class__outlined),
                        Text(
                       ' Phân loại cây ',
                        style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),
                          ),
                        ],
                    ),
                    SizedBox(height: 10),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.black87, )
                            ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                        child: DropdownButtonHideUnderline(

                          child:  DropdownButton(
                            hint: Text('Select'),
                            value: dropDownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 30,
                            elevation: 16,
                            isExpanded: true,
                            isDense: true,
                            //underline: ,
                            style: const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),
                            onChanged: (newValue){
                              setState(() {
                                dropDownValue=newValue;
                              });
                            },
                            items: <String>[
                              'Cây ăn quả',
                              'Cây dành cho người nghèo',
                              'Cây hết tiền rồi',
                              'Cây không có  gì ăn',
                              'Cây đói',
                              'Cây thuốc súng',
                              'Cây mê trai',
                              'Kim Heechul và người đàn bà điên'
                            ].map((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                    ),
                      ],
                       )
                    ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Transport()),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.train_outlined),
                    Expanded(
                      child:
                      Text(
                        ' Phí vận chuyển',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),

              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Icon(Icons.addchart),
                  Text(
                      ' Hàng đặt trước',
                      style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),
                    ),
                  new Spacer(),
                  Switch(
                      activeColor: Colors.green,
                      value: enableFeature,
                      onChanged: (enabled){
                        setState(() {
                          enableFeature = enabled;
                        });
                      }
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            RaisedButton(
                color: Color(0xFF407C5A),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: ()=>null,
                child: Text(
                    'Lưu'.toUpperCase(),
                    style: TextStyle(fontSize: 20,color: Colors.yellow,),
                ),
            )
          ],
        ),
      ),
    );
  }
}
