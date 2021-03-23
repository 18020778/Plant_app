import 'package:first_app/show_products_page/detail_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TreeItem extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String amount;
  bool isFavorited;
  final String location;

  TreeItem(
      {Key key,
      this.name,
      this.image,
      this.price,
      this.amount,
      this.isFavorited,
      this.location})
      : super(key: key);

  @override
  _TreeItemState createState() => _TreeItemState();
}

class _TreeItemState extends State<TreeItem> {
  @override
  Widget build(BuildContext context) {
    var setImage = widget.isFavorited
        ? Image.asset(
            'assets/heart_like.png',
            width: 20,
          )
        : Image.asset(
            'assets/heart.png',
            width: 20,
          );

    return Padding(
      padding: EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 10),
      child: Container(
        child: InkWell(
          onTap: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailItem())
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(4291751385),
                            offset: Offset(0, 140),
                            spreadRadius: 0,
                            blurRadius: 100.0),
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2.0,
                            blurRadius: 2.0),
                      ]),
                  margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 137,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Image.asset(
                          widget.image,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.price,
                                      style: TextStyle(color: Colors.green[900]),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text: 'Đã bán ',
                                          ),
                                          TextSpan(text: widget.amount),
                                        ]))
                                  ],
                                ),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          alignment: Alignment.centerLeft,
                                          icon: (setImage),
                                          onPressed: () {
                                            setState(() {
                                              if (widget.isFavorited) {
                                                widget.isFavorited = false;
                                                setImage = Image.asset(
                                                  'assets/heart.png',
                                                  width: 20,
                                                );
                                              } else {
                                                widget.isFavorited = true;
                                                setImage = Image.asset(
                                                  'assets/heart_like.png',
                                                  width: 20,
                                                );
                                              }
                                            });
                                          }),
                                      //isFavorited là biến bool, xét xem ng đó đã tym sp đó chưa
                                      Row(
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/location.png",
                                            width: 20,
                                          ),
                                          Text(widget.location),
                                        ],
                                      )
                                    ])
                              ]))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
