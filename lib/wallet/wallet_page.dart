import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(4281755726), Color(0xFF488B66)],
                  ),
                ),
          child: Column(
        children: [
          SizedBox(height: 30,),
          Text("Ví điện tử", textAlign: TextAlign.center,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.white)),
          SizedBox(height: 50,),
          Text('Tổng tiề trong Ví', ),
          Text("đ " + 36000.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
          Row(
            children: [
              Column(
                children: [
                  Text("Số dư Ví"),
                  Text("đ" + 36000.toString()),
                ],
              ),
              Column(
                children: [
                  Text("Ví thưởng ?"),
                  Text("đ" + 0.toString()),
                ],
              ),
            ],
          ),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset("assets/addWallet.png", width: 30, height: 30, fit: BoxFit.cover,),
                    Text("Nạp tiền"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/viewCard.png", width: 30, height: 30, fit: BoxFit.cover,),
                    Text('Liên kết\ntài khoản'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/add_card.png", width: 30, height: 30, fit: BoxFit.cover,),
                    Text('Thêm tài khoản\nliên kết'),
                  ],
                ),
              ],
            ),
          )
        ],
    )),

        ],
      ),
    );
  }
}
