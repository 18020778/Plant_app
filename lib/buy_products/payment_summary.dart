
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
              bottom: 10, left: 20),
          child: Text('SUMMARY'),
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
                      text: 'Total ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'including VAT',
                          style: TextStyle(color: Colors.black.withAlpha(90)),
                        ),
                      ],
                    ),
                  ),
                  Text('${NumberFormat(',###').format(amount)} ₫'),
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
                    'Discount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('0 ₫'),
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
                    'After Discount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${NumberFormat(',###').format(amount)} ₫'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}