import 'package:first_app/buy_products/payment_method.dart';
import 'package:first_app/buy_products/payment_summary.dart';
import 'package:first_app/buy_products/show_cart_0.dart';
import 'package:first_app/models/shippingInfor.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/services/purchase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_vn/momo_vn.dart';
import 'package:flutter/foundation.dart';
import 'package:random_string/random_string.dart';
import 'package:first_app/my_orders/my_orders_screen.dart';

class MomoWallet extends StatefulWidget {
  User user;
  int totalMoney;
  List<Cart> listCard;
  shippingInfor item;
  @override
  _MomoWalletState createState() => _MomoWalletState();
  MomoWallet(this.user, this.totalMoney,this.listCard, this.item );
}

class _MomoWalletState extends State<MomoWallet> {
  MomoVn _momoPay;
  PaymentResponse _momoPaymentResult;
  // ignore: non_constant_identifier_names
  String _paymentStatus;



  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _paymentStatus = "";
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('THANH TOÁN QUA ỨNG DỤNG MOMO'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  PaymentSummary(totalMoney: widget.totalMoney),
                  SizedBox(height: 30),
                  PaymentMethod(),
                  //Spacer(),
                  RaisedButton(
                      child: Text('Place Order'),
                      onPressed: () async {
                        MomoPaymentInfo options = MomoPaymentInfo(
                            merchantName: "Handmade Comany",
                            appScheme: "momoulgh20210723",
                            partnerCode: 'MOMOULGH20210723',
                            merchantCode: 'MOMOULGH20210723',
                            amount: widget.totalMoney,
                            orderId: randomAlpha(20).toString(),
                            orderLabel: 'Gói combo',
                            merchantNameLabel: "first_app",
                            fee: 0,
                            description: 'Thanh toán đơn hàng mua tại Handmade App',
                            username: widget.user.userName,
                            partner: 'merchant',
                            extra: "",
                            isTestMode: true
                        );
                        try {
                          _momoPay.open(options);
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                    ),
                ],
              ),
              Text(_paymentStatus.isEmpty ? "CHƯA THANH TOÁN" : _paymentStatus)
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _momoPay.clear();
  }
  void _setState() {
    _paymentStatus = 'Đã chuyển thanh toán';
    if (_momoPaymentResult.isSuccess == true) {
      _paymentStatus += "\nTình trạng: Thành công.";
      _paymentStatus += "\nSố điện thoại: " + _momoPaymentResult.phoneNumber.toString();
    }
    else {
      _paymentStatus += "\nTình trạng: Thất bại.";
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra.toString();
    
    }
  }
  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(msg: "THANH TOÁN THÀNH CÔNG", timeInSecForIos: 4);

    orderSucess();
  }
void orderSucess() async {
  widget.listCard.forEach((element) {
                    PurchaseService().buyProducts(widget.user.uid, widget.item.uid, element.img, element.price,element.productID,  element.nameProduct, element.shop.uid, element.amount, element.amount*int.parse(element.price), true );
                    PurchaseService().deteleItemInCart(widget.user.uid, element.productID);
                  });
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyOrdersScreen(user: widget.user,),
      ),
    );
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(msg: "THANH TOÁN THẤT BẠI", timeInSecForIos: 4);
  }
}

