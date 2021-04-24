import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/user.dart';

class Database{
  final Firestore  _firestore = Firestore.instance;

  // create account user.
  Future <String> createUser(User user) async{
    String retVal =  "error";
    try{
      await _firestore.collection("users").document(user.uid).setData(
        {
          'uid' : user.uid,
          'phoneNumber' : user.phoneNumber,
          'userName' :user.userName,
          'address' : null,
          'email': user.email,
          'urlImage' : "https://www.google.com/url?sa=i&url=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F49917726%2Fretrieving-default-image-all-url-profile-picture-from-facebook-graph-api&psig=AOvVaw0n5vtKyGmIbvvcwq4owuuI&ust=1615715347672000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJjNs-7-rO8CFQAAAAAdAAAAABAD",
          'accountCreated': Timestamp.now(),
        }
      );
      retVal = "success";
    }catch(e){
      print(e);
    }
    return retVal;
  }

  // get User Info

  Future <dynamic> getUserInfo(String uid) async{
    User retVal =new User();
    try{
       DocumentSnapshot _docSnapshot = await Firestore.instance.collection("users").document(uid).get();
       if (!_docSnapshot.exists)
         {
           print("null");
           return null;
         }
       else {
         retVal.uid = uid;
         retVal.userName = _docSnapshot.data["userName"];
         retVal.phoneNumber = _docSnapshot.data["phoneNumber"];
         retVal.email = _docSnapshot.data["email"];
         retVal.urlImage = _docSnapshot.data["urlImage"];
         retVal.accountCreated = _docSnapshot.data["accountCreated"];
         return retVal;
       }

    }catch(e) {
      print(e);
    }
  }

}