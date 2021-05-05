import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/handBook.dart';
import 'package:first_app/models/user.dart';
import 'package:first_app/services/database.dart';

class handbookService{
      final _firebaseStore = Firestore.instance;
      // // each user has handbooks
      // Future <String> createhandBook(String uid,  handBook handBookValue) async {
      //   try{
      //     await _firebaseStore.collection("users").document(uid).collection('handbooks').document(handBookValue.handbookId).setData({
      //       'handbookId': handBookValue.handbookId,
      //       'title' : handBookValue.title,
      //       'plantName' : handBookValue.plantName,
      //       'content' :  handBookValue.content,
      //       'imageUrl' : "https://ak.picdn.net/shutterstock/videos/2599205/thumb/1.jpg",
      //     });
      //     return "success";
      //   }catch(e){
      //     return e.toString();
      //   }
      // }
      getAllHandBook(){
        return Firestore.instance
                .collection("handbooks")
                .getDocuments();
      }
      // list  handbook of user
      getHandBook(String uid){
        return Firestore.instance
                .collection("handbooks")
                .where('userUid', isEqualTo: uid)
                .getDocuments();
      }

      Future<dynamic> gethandBookByUid(String handbookUid) async{
        handBook retVal = new handBook();
        try{
          _firebaseStore.collection("handbooks").document(handbookUid).get().then((value){
            if (value == null){
              return null;
            }else {
              retVal.setHandBookId(handbookUid);
              retVal.setContent(value['content']);
              retVal.setImageUrl(value['imageUrl']);
              retVal.setPlantName(value['plantName']);
              retVal.setTitle(value['title']);
              retVal.setTimeCreated(value['timeCreated']);
              retVal.setUserUid(value['userUid']);
              // retVal.setUserName(value['userName']);
              // retVal.setAvatarArticle(value['avatarArticle']);
            }
          });

          return retVal;
        }catch(e){
          return e.toString();
        }

      }
}