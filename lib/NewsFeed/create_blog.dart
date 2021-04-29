
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
File selectedImage;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {

    String authorName, title, desc;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Bài viết của tôi',
          style: TextStyle(fontSize: 22),),
        backgroundColor: Color(0xFF407C5A),
        actions: [
          FlatButton(
              onPressed: (){},
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
                      TextField(
                        textAlign: TextAlign.justify,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            hintText: "Tên tác giả",
                          ),
                          onChanged: (val) {
                            authorName = val;
                          },
                        ),
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
    );
  }
}
