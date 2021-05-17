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
        height: 50.0,
        width: 100,
        decoration: BoxDecoration(
          color: Color(4291751385),
        ),
        child: FlatButton(
          onPressed: () {},
          //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Text(
            _options[index],
            style: TextStyle(
              color: _selectedIndex == index
                  ? Colors.black
                  : Color(0xFF407C5A),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 610,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
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
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                //padding: const EdgeInsets.all(4.0),
                //mainAxisSpacing: 0.0,
                //crossAxisSpacing: 0.0,
                // children: [
                //   TreeItem(name: "Xương rồng",
                //       image: "assets/xuong_rong.jpg",
                //       price: "20k",
                //       amount: '2',
                //       isFavorited: false,
                //       location: "Hà Nội"),
                //   TreeItem(name: "Xương rồng",
                //       image: "assets/xuong_rong.jpg",
                //       price: "20k",
                //       amount: '2',
                //       isFavorited: false,
                //       location: "Hà Nội"),
                //   TreeItem(name: "Xương rồng",
                //       image: "assets/xuong_rong.jpg",
                //       price: "20k",
                //       amount: '2',
                //       isFavorited: false,
                //       location: "Hà Nội"),
                //   TreeItem(name: "Xương rồng",
                //       image: "assets/xuong_rong.jpg",
                //       price: "20k",
                //       amount: '2',
                //       isFavorited: false,
                //       location: "Hà Nội"),
                //   TreeItem(name: "Xương rồng",
                //       image: "assets/xuong_rong.jpg",
                //       price: "20k",
                //       amount: '2',
                //       isFavorited: false,
                //       location: "Hà Nội"),
                // ],
              ),
            ),
          ],
        )

    );
  }}

    

