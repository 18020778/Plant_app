import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TreeItem.dart';

class ShowItem extends StatefulWidget {
  @override
  _ShowItemState createState() => _ShowItemState();
}
@override
class _ShowItemState extends State<ShowItem> {
  List<String> _options = ["Tất cả", "Bán chạy", "Giá tăng", "Giá giảm"];
  int _selectedIndex = 0;
  Widget _buildMenu(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme
              .of(context)
              .accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Text(
            _options[index],
            style: TextStyle(
              color: _selectedIndex == index
                  ? Theme
                  .of(context)
                  .primaryColor
                  : Color(0xFFB4C1C4),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _options
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildMenu(map.key),
            )
                .toList(),
          ),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 4.0,
            children: [
              TreeItem(name: "Xương rồng", image: "assets/xuong_rong.jpg", price: "20k", amount: '2', isFavorited: false, location: "Hà Nội"),
              TreeItem(name: "Xương rồng", image: "assets/xuong_rong.jpg", price: "20k", amount: '2', isFavorited: false, location: "Hà Nội"),
              TreeItem(name: "Xương rồng", image: "assets/xuong_rong.jpg", price: "20k", amount: '2', isFavorited: false, location: "Hà Nội"),
            ],
          ),
        ],
      )

    );
  }
}

