
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart {
  final String shopName;
  bool checkBox;
  final String img;
  final String nameProduct;
  final int price;
  int amount;

  Cart({this.shopName, this.checkBox, this.img, this.nameProduct, this.price, this.amount});

}


class showCart extends StatefulWidget {
  @override
  _showCartState createState() => _showCartState();
}

class _showCartState extends State<showCart> {

  @override
  Widget build(BuildContext context) {
    List<Cart> list_cart = [
      Cart(shopName: "shopname1", checkBox: true, img: 'assets/bonsai.jpg', nameProduct: 'NameProduct1', price: 100000, amount:2),
      Cart(shopName: "shopname2", checkBox: false, img: 'assets/cay_day_leo.jpg', nameProduct: 'NameProduct2', price: 200000, amount:1),
      Cart(shopName: "shopname3", checkBox: true, img: 'assets/bonsai.jpg', nameProduct: 'NameProduct1', price: 100000, amount:2),
      Cart(shopName: "shopname4", checkBox: false, img: 'assets/cay_day_leo.jpg', nameProduct: 'NameProduct2', price: 200000, amount:1),
    ] ;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      var totalMoney = 0;
      for(var item in list_cart) {
        if (item.checkBox) totalMoney += item.price*item.amount;
      }
      return Scaffold(
          appBar: AppBar(
              toolbarHeight: 60,
              title: Text(
                "Giỏ hàng",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              centerTitle: true,
              elevation: 0.0,
              bottomOpacity: 0.0,
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(4281755726), Color(0xFF488B66)],
                ),
              )),
              actions: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.white,
                    size: 27.0,
                  ),
                  onPressed: () {},
                )
              ]),
          body: SingleChildScrollView(
            child: Stack(
                children: [
                  Container(
                    height: 192.0*list_cart.length,
                    child: Column(
                      children: [
                    for(int i=0; i<list_cart.length;i++) cartItem(shopName: list_cart[i].shopName, checkBox: list_cart[i].checkBox, img: list_cart[i].img, nameProduct: list_cart[i].nameProduct, price: list_cart[i].price, amount: list_cart[i].amount,),
                    ]),
                  ),
                ],
              ),
          ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 5,
              color: Color(0xFFDADADA).withOpacity(0.5),
            )]
          ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tổng tiền: ", style: TextStyle(fontSize: 18),),
                Text("đ" + totalMoney.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,)),
                  ],
                ),
          ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 25),
                color: Color(0xFF488B66),
                child: Text("Mua hàng", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),),
                onPressed: () {},
              ),
              ],
            ),
        ),


      );
    });
  }
}

class cartItem extends StatefulWidget {
  final String shopName;
  bool checkBox;
  final String img;
  final String nameProduct;
  final int price;
  int amount;

  cartItem({Key key, this.shopName, this.checkBox, this.img, this.nameProduct, this.price, this.amount}): super(key: key);

  @override
  _cartItemState createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Container(
        margin: EdgeInsets.only(bottom: 30),
          child: Column(children: [
        ColoredBox(
          color: Color(0xFFE6FFEE),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      widget.shopName,
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                  },
                  child: Text(
                    "Xóa",
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ))
            ],
          ),
        ),
        Row(children: [
          Checkbox(
            value: widget.checkBox,
            onChanged: (bool value) {
              setState(() {
                widget.checkBox = value;
              });
            },
            activeColor: Color(0xFF488B66),
            checkColor: Colors.white,
          ),
          Image.asset(
            widget.img,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nameProduct,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "đ" + widget.price.toString(),
                  style: TextStyle(color: Color(0xFF488B66), fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ButtonTheme(
                      minWidth: 50,
                      child: OutlineButton(
                        onPressed: () {
                          setState(() {
                            while (widget.amount > 0) {
                              widget.amount--;
                            }
                          });
                        },
                        child: Text(
                          "-",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    ButtonTheme(
                        minWidth: 50,
                        child: OutlineButton(
                          onPressed: null,
                          child: Text(
                            widget.amount.toString(),
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        )),
                    ButtonTheme(
                      minWidth: 50,
                      child: OutlineButton(
                        onPressed: () {
                          setState(() {
                            widget.amount++;
                          });
                        },
                        child: Text(
                          "+",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ])
      ])),
    Container(
      height: 15,
      decoration: BoxDecoration(
        color: Colors.black12
      ),
    )
      ]);
  }
}
