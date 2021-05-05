
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/login_reg_pages/loading.dart';
import 'package:first_app/models/handBook.dart';
import 'package:first_app/models/plant.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/services/database.dart';
import 'package:first_app/services/handbookService.dart';
import 'package:first_app/services/plant_service.dart';
import 'package:first_app/services/uploadFile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatefulWidget {
  User user;
  @override
  _CreateBlogState createState() => _CreateBlogState();

  CreateBlog({this.user});

}

class _CreateBlogState extends State<CreateBlog> {
  File selectedImage;
  String title, desc;
  String dropdownValue;
  bool viewResult = false;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(image.path);
    });
  }
  List<String> namePlants = new List();
  @override
  void initState() {
    super.initState();
    PlantService().getPlants().then((QuerySnapshot docs){
      if(docs.documents.isNotEmpty){
        setState(() {
          this.viewResult = true;
        });
        docs.documents.forEach((element) {
          this.namePlants.add(element.data["plantName"]);
        });
      }else{
        print("Empty");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return this.viewResult ? Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Bài viết của tôi',
          style: TextStyle(fontSize: 22),),
        backgroundColor: Color(0xFF407C5A),
        actions: [
          FlatButton(
              onPressed: (){
                if(this.title == null || this.dropdownValue == null || this.desc == null){
                  Fluttertoast.showToast(msg: "Vui lòng điền đầy đủ thông tin");
                }
                else {
                  handBook  handBookValue  = new handBook(  title:  this.title, plantName: this.dropdownValue, content: this.desc);
                  //CollectionReference ref = Firestore.instance.collection('users').document(widget.user.getUid()).collection("handbooks");
                  CollectionReference ref = Firestore.instance.collection("handbooks");
                  DocumentReference document = ref.document();
                  document.setData({
                    'title' : handBookValue.title,
                    'plantName' : handBookValue.plantName,
                    'content' :  handBookValue.content,
                    'imageUrl' : "https://ak.picdn.net/shutterstock/videos/2599205/thumb/1.jpg",
                    'handbookId' : document.documentID,
                    'timeCreated' : Timestamp.now(),
                    'userUid' : widget.user.getUid(),
                    'userName' : widget.user.getUserName(),
                    'avatarArticle' : widget.user.getUrlImage(),
                  });

                  if (selectedImage != null){
                    uploadFile().uploadImageHandBook(widget.user.getUid(),document.documentID , selectedImage);
                  }
                  Navigator.pop(context);
                }
              },
              child: Text("Lưu", style: TextStyle( fontSize: 20, color: Colors.white),)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey[50],
          height: 1000,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: selectedImage != null ? Image.file(selectedImage, fit: BoxFit.cover,) : Icon(Icons.add_a_photo, color: Colors.black45,),
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        textAlign: TextAlign.justify,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            hintText: "Tiêu đề",
                          ),
                          onChanged: (val) {
                            title = val;
                          },
                        ),

                      Row(
                        children: <Widget>[
                          Container(
                            width : 100.0,
                            child: TextField(
                            textAlign: TextAlign.justify,
                            //keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: "Thể loại cây",
                            ),
                          ),
                          ),
                          Container(child:
                          DropdownButton<String>(
                            value: dropdownValue,
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color : Color(0xFF407C5A), fontSize: 15),
                            underline: Container(
                              height: 2,

                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: namePlants
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ))
                        ],
                      )
                  ,
                     TextField(
                       textAlign: TextAlign.justify,
                       keyboardType: TextInputType.multiline,
                       maxLines: null,
                       style: TextStyle(fontSize: 20, ),
                          decoration: InputDecoration(
                            hintText: "Bạn muốn chia sẻ điều gì?",
                          ),
                          onChanged: (val) {
                            desc = val;
                          },
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ) : Loading();
  }


}
