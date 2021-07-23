import 'package:first_app/buy_products/payment_method.dart';
import 'package:first_app/buy_products/payment_summary.dart';
import 'package:first_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_vn/momo_vn.dart';
import 'package:flutter/foundation.dart';
import 'package:random_string/random_string.dart';

class MomoWallet extends StatefulWidget {
  User user;
  int totalMoney;
  @override
  _MomoWalletState createState() => _MomoWalletState();
  MomoWallet(this.user, this.totalMoney);
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
                            merchantCode: 'MOMOULGH2021',
                            amount: widget.totalMoney,
                            orderId: randomAlpha(20).toString(),
                            orderLabel: 'Gói combo',
                            merchantNameLabel: "first_app",
                            fee: 0,
                            description: 'Thanh toán đơn hàng mua tại Handmade App',
                            username: widget.user.userName,
                            partner: 'merchant',
                            extra: '',
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
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra;
      _paymentStatus += "\nToken: " + _momoPaymentResult.token.toString();
    }
    else {
      _paymentStatus += "\nTình trạng: Thất bại.";
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra.toString();
      _paymentStatus += "\nMã lỗi: " + _momoPaymentResult.status.toString();
    }
  }
  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(msg: "THÀNH CÔNG: " + response.phoneNumber.toString(), toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    Fluttertoast.showToast(msg: "THẤT BẠI: " + response.message.toString(), toastLength: Toast.LENGTH_SHORT);
  }
}

