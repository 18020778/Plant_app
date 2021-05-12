import 'package:first_app/models/user.dart';
import 'package:first_app/show_products_page/TreeItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikedPage extends StatefulWidget {
  User user;
  @override
  _LikedPageState createState() => _LikedPageState();

  LikedPage({this.user});
}

class _LikedPageState extends State<LikedPage> {
  List<String> _options = ["Tất cả", "Gần đây"];
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
        width: MediaQuery.of(context).size.width*0.49,
        decoration: BoxDecoration(
          color: Color(4291751385),
        ),
        child: FlatButton(
          onPressed: () {},
          //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Text(
            _options[index],
            style: TextStyle(
              color: _selectedIndex == index ? Colors.black : Color(0xFF407C5A),
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
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Text("Lượt thích", style: TextStyle(fontSize: 23),),
           // leadingWidth: 20,
            centerTitle: true,
            backgroundColor: Color(0xFF407C5A),
            actions: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.white,
                  size: 27.0,
                ),
                onPressed: () {},
              ),
            ]),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 500,
                    child: Column(
                      children: <Widget>[
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
                            childAspectRatio: 0.75,
                            //padding: const EdgeInsets.all(4.0),
                            //mainAxisSpacing: 0.0,
                            //crossAxisSpacing: 0.0,
                            children: [
                              TreeItem(
                                  name: "Xương rồng",
                                  image: "assets/xuong_rong.jpg",
                                  price: "20k",
                                  amount: '2',
                                  isFavorited: false,
                                  location: "Hà Nội"),
                              TreeItem(
                                  name: "Xương rồng",
                                  image: "assets/xuong_rong.jpg",
                                  price: "20k",
                                  amount: '2',
                                  isFavorited: false,
                                  location: "Hà Nội"),
                              TreeItem(
                                  name: "Xương rồng",
                                  image: "assets/xuong_rong.jpg",
                                  price: "20k",
                                  amount: '2',
                                  isFavorited: false,
                                  location: "Hà Nội"),
                              TreeItem(
                                  name: "Xương rồng",
                                  image: "assets/xuong_rong.jpg",
                                  price: "20k",
                                  amount: '2',
                                  isFavorited: false,
                                  location: "Hà Nội"),
                              TreeItem(
                                  name: "Xương rồng",
                                  image: "assets/xuong_rong.jpg",
                                  price: "20k",
                                  amount: '2',
                                  isFavorited: false,
                                  location: "Hà Nội"),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                              //offset: Offset(0.0, 5.0),
                              blurRadius: 1
                            )],

                          ),
                        )
                      ],
                    )),
                SizedBox(height: 20,),
                // Container(
                //   height: 610,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(left: 8.0),
                //         child: Text("Có thể bạn cũng thích", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700, color: Color(0xFF488B66)),),
                //       ),
                //       Expanded(
                //         child: GridView.count(
                //           crossAxisCount: 2,
                //           childAspectRatio: 0.75,
                //           //padding: const EdgeInsets.all(4.0),
                //           //mainAxisSpacing: 0.0,
                //           //crossAxisSpacing: 0.0,
                //           children: [
                //             TreeItem(
                //                 name: "Xương rồng",
                //                 image: "assets/xuong_rong.jpg",
                //                 price: "20k",
                //                 amount: '2',
                //                 isFavorited: false,
                //                 location: "Hà Nội"),
                //             TreeItem(
                //                 name: "Xương rồng",
                //                 image: "assets/xuong_rong.jpg",
                //                 price: "20k",
                //                 amount: '2',
                //                 isFavorited: false,
                //                 location: "Hà Nội"),
                //             TreeItem(
                //                 name: "Xương rồng",
                //                 image: "assets/xuong_rong.jpg",
                //                 price: "20k",
                //                 amount: '2',
                //                 isFavorited: false,
                //                 location: "Hà Nội"),
                //             TreeItem(
                //                 name: "Xương rồng",
                //                 image: "assets/xuong_rong.jpg",
                //                 price: "20k",
                //                 amount: '2',
                //                 isFavorited: false,
                //                 location: "Hà Nội"),
                //             TreeItem(
                //                 name: "Xương rồng",
                //                 image: "assets/xuong_rong.jpg",
                //                 price: "20k",
                //                 amount: '2',
                //                 isFavorited: false,
                //                 location: "Hà Nội"),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            )
        ));
  }
}
