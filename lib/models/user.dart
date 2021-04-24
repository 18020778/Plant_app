import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String uid;
  String userName;
  String phoneNumber;
  String email;
  String urlImage;
  String address;
  Timestamp accountCreated;



  // getter and setter
  Timestamp getAccountCreated(){
    return this.accountCreated;
  }
  String getUid(){
    return this.uid;
  }
  void setUid(String uid){
    this.uid = uid;
  }
  String getUserName(){
    return this.userName;
  }
  void setUserName(String userName){
    this.userName = userName;
  }
  String getPhoneNumber(){
    return this.phoneNumber;
  }
  void setPhoneNumber(String phoneNumber){
    this.phoneNumber = phoneNumber;
  }

  String getEmail(){
    return this.email;
  }
  void setEmail(String email){
    this.email = email;
  }
  String getUrlImage(){
    return this.urlImage;
  }
  void setUrlImage(String urlImage){
    this.urlImage = urlImage;
  }
  String getAddress(){
    return this.address;
  }
  void setAddress(String address){
    this.address = address;
  }
}