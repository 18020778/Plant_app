import 'package:flutter/material.dart';

class EditName extends StatefulWidget {
  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  String newName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF407C5A), //change your color here
        ),
        title: Text("Sửa tên", style: TextStyle(color: Colors.black, fontSize: 22),),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: (){
                  Navigator.pop(context, this.newName);
              },
              child: Text("Lưu", style: TextStyle( fontSize: 20, color: Color(0xFF407C5A)),)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Theme(
              data: new ThemeData(
                primaryColor: Colors.grey,
                primaryColorDark: Colors.grey,
              ),
              child: TextField(
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(contentPadding: EdgeInsets.all(8),
                   filled: true,
                    fillColor: Colors.white,
                    hintText: "Tên đăng nhập",
                    hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
               ),
                onChanged: (value){
                  this.newName = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Dưới 100 kí tự", style: TextStyle(color: Colors.black54, fontSize: 18),),
            )
          ],
        ),
      ),
    );
  }
}
