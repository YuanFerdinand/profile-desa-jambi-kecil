import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  String sejarah = "sejarahkito";
  Future tambahInfoAkun(
      var userCredential, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getUserInfo(var email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  static Future<String> uploadGambar(File imageFIle) async {
    String fileName = basename(imageFIle.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFIle);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }

  Future updateSejarah(Map<String, dynamic> updateInfo) async {
    return FirebaseFirestore.instance
        .collection("latarBelakang")
        .doc("sejarah")
        .update(updateInfo);
  }

  getSejarah(editSejarah) {
    return this.sejarah = editSejarah;
  }
}
