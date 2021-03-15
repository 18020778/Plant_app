import 'package:first_app/show_products_page/bottom_nav_bar.dart';
import 'package:first_app/show_products_page/search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupOfTrees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: SearchBox(text: 'NameTypeOfTree'),
        backgroundColor: Color(4284859275),
    ),
      body: SingleChildScrollView(
        child: Container(
          child: BodyOfGroup(),
        )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BodyOfGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}

