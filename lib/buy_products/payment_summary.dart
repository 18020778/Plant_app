
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    Key key, this.totalMoney,
  }) : super(key: key);
  final int totalMoney;
  @override
  Widget build(BuildContext context) {
    final int amount = totalMoney;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10,
              bottom: 10, left: 20),
          child: Text('THANH TOÁN', style: TextStyle(fontSize: 16),),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(color: Colors.grey.withAlpha(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Tổng tiền',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Text('${NumberFormat(',###').format(amount)} ₫', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Divider(thickness: 1, height: 0),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(color: Colors.grey.withAlpha(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Giảm giá',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text('0 ₫', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Divider(thickness: 1, height: 0),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(color: Colors.black.withAlpha(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Số tiền phải trả',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text('${NumberFormat(',###').format(amount)} ₫', style: TextStyle(fontSize: 16) ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}