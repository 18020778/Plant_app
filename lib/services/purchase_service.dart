import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/buy_products/show_cart_0.dart';
import 'package:first_app/models/shippingInfor.dart';

class PurchaseService{
  final Firestore _firestore = new Firestore();

  // add Product to the cart
  Future<String> addProductToTheCart(String productID, int amount, String userID, String shopID, String imageUrl, String productName, String price) async{
    String retVal = "error";
    try{
      await _firestore.collection("users").document(userID).collection("productInCart").document(productID)
          .setData({
        "productID" : productID,
        "amount" : amount,
        "shopID" : shopID,
        "imageUrl" : imageUrl,
        "productName" : productName,
        "price" : price
      });
      retVal = "success";
    }catch(e){
      
    }
    return retVal;
  }
  getAllProductInCart(String userUID) {
    return Firestore.instance.collection("users").document(userUID)
        .collection("productInCart")
        .orderBy("shopID", descending: true)
        .getDocuments();
  }
  
  // delete
  Future<String> deteleItemInCart(String uid, String itemInCartUID) async{
    try{
      _firestore.collection("users").document(uid).collection("productInCart").document(itemInCartUID).delete();
      return "success";
    }catch(e){
      return e.toString();
    }
  }
  Future<String> buyProducts(String uid,String deliverID , String productImageUrl, String price, String productID, String productName, String shopID, int amount , int totalMoney) async{
    try{
        CollectionReference ref = _firestore.collection('users').document(uid).collection("orders");
        DocumentReference document = ref.document();
        document.setData(
            {
              'uid': document.documentID,
              'dateTime' : Timestamp.now(),
              'deliverID' : deliverID,
              'productImageUrl': productImageUrl,
              'price': price,
              'productID' : productID,
              'productName' : productName,
              'shopID' : shopID,
              'amount' : amount,
              'totalMoney' : totalMoney
      });
        return "success";
    }catch(e){
      return e.toString();
    }
  }

  // return all bought

  getAllOrders(String uid)async{
    return _firestore.collection("users").document(uid).collection("orders").getDocuments();
  }

  // get OrderDetail

  getOrderDetail(String uid, String orderID) async{
    return _firestore.collection("users").document(uid).collection("orders")
        .where("uid", isEqualTo: orderID)
        .getDocuments();
  }
}