import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetail{
  int amount;
  Timestamp dateTime;
  String deliverID;
  String price;
  String productId;
  String image;
  String productName;
  String shopID;
  int productMoney;
  String orderDetailID;
  bool paid;

  OrderDetail(
      {this.amount,
        this.dateTime,
        this.deliverID,
        this.price,
        this.productId,
        this.image,
        this.productName,
        this.shopID,
        this.productMoney,
        this.orderDetailID,
      this.paid});

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
      amount: json['amount'],
      dateTime: json['dateTime'],
      deliverID : json['deliverID'],
      price: json['price'],
      productId : json['productID'],
      image : json['productImageUrl'],
      productName :  json['productName'],
      shopID : json['shopID'],
      productMoney : json['totalMoney'],
      orderDetailID: json['uid'],
      paid: json['paid']
  );
}