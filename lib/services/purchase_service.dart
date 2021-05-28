import 'package:cloud_firestore/cloud_firestore.dart';

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
}