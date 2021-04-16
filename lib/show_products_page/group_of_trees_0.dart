import 'package:first_app/show_products_page/show_items_3.dart';
import 'package:first_app/show_products_page/show_items_page_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListGroupOfTrees extends StatelessWidget {
  const ListGroupOfTrees({
    Key key,
    this.groupItems,
    this.groupImages,
  }) : super(key: key);

  final List<String> groupItems;
  final List<String> groupImages;

  @override
  Widget build(BuildContext context) {
    var glength = groupItems.length;
    List<Widget> banners = new List<Widget>();
    for (int i = 0; i < glength; i++) {
      var bannerView = Container(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ShowItemPage()));
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Image.asset(groupImages[i], width: 70, height: 69),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                groupItems[i],
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      height: (glength % 4 == 0)
          ? (glength / 4) * 110
          : (glength / 4 + 1) * 110,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white, Color(4291751385)],
      )),
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 4.0,
        children: banners.toList(),
      ),
    );
  }
}
