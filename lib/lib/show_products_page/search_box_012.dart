import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
    this.text,
    this.onChanged,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.green[900].withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Image.asset(
              'assets/Search_Icon.svg.png',
              width: 25,
            ),
            hintText: text,
            hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
      ),
    );
  }
}
