
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            bottom: 10,
          ),
          child: Text('PHƯƠNG THỨC THANH TOÁN', style: TextStyle(fontSize: 16)),
        ),
        Column(
          children: [
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(color: Color(0xFF979797).withAlpha(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://img.mservice.io/momo-payment/icon/images/logo512.png',
                          height: 40,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.image),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Color(0xFFFF7643),
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        Text('ví MoMo', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1, height: 0),
            /*InkWell(
              onTap: () {
                choice.value = 2;
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: (15),
                  horizontal: (20),
                ),
                decoration: BoxDecoration(color: Color(0xFF979797).withAlpha(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Direct'),
                    if (choice.value == 2)
                      Icon(
                        Icons.check_rounded,
                        size: (20),
                      ),
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ],
    );
  }
}