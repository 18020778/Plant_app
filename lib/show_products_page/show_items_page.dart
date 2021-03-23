import 'package:first_app/show_products_page/bottom_nav_bar.dart';
import 'package:first_app/show_products_page/search_box.dart';
import 'package:first_app/show_products_page/show_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowItemPage extends StatefulWidget {
  @override
  _ShowItemPageState createState() => _ShowItemPageState();
}

class _ShowItemPageState extends State<ShowItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 75,
          title: SearchBox(text: 'NameGroupOfTree'),
          leadingWidth: 20,
          centerTitle: true,
          backgroundColor: Color(0xFF407C5A),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/alert.png',
                width: 35,
                height: 35,
              ),
              onPressed: () {},
            )
          ]),
      body: ShowItem(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
