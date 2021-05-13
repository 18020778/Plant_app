import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Transport extends StatefulWidget {
  @override
  _TransportState createState() => _TransportState();
}

class _TransportState extends State<Transport>{
  //final picker =ImagePicker();
  bool enableFeature = false;
  @override
  Widget build (BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF407C5A),
        iconTheme: IconThemeData(
          color: Colors.yellow,
        ),
        title:  Text(
          'Phí vận chuyển',
          style: TextStyle(color: Colors.yellow, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.monetization_on_sharp),
                  Text(
                    'Cân nặng sản phẩm ',
                    style: TextStyle(fontSize: 23,),
                  ),
                  //
                  Expanded(
                    child: new TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.green,
                          hintText: 'gam',
                          hintStyle: TextStyle(color: Colors.green, decoration: TextDecoration.underline, fontSize: 20) ),
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Icon(Icons.train),
                  Text(
                    ' Giao hàng nhanh',
                    style: TextStyle(fontSize: 23),
                  ),
                  new Spacer(),
                  Switch(
                      activeColor: Colors.green,
                      value: enableFeature,
                      onChanged: (enabled){
                        setState(() {
                          enableFeature = enabled;
                        });
                      }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
