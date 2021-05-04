import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_sorted_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/models/user.dart';


class uploadFile {
  Future uploadImageToFirebase(String uid, File _imageFile) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(
        "users/$uid/avatar");
    StorageUploadTask uploadTask = reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    final String downloadImage = await taskSnapshot.ref.getDownloadURL();
    Firestore.instance.collection("users").document(uid).updateData({
      'urlImage' : downloadImage
    });
    return taskSnapshot.ref.getDownloadURL();
  }
}