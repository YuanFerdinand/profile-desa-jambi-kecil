import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  String sejarah = "sejarahkito";
  String perbatasanUtara = "GAMBAR";
  String perbatasanTimur = "GAMBAR";
  String perbatasanSelatan = "GAMBAR";
  String perbatasanBarat = "GAMBAR";
  String visi = "GAMBAR";
  String misi = "GAMBAR";
  int luasWilayah = 0;
  int rt = 0;
  int lk = 0;
  String nama = "GAMBNAR";
  String ttl = "GAMBNAR";
  String jabatan = "GAMBNAR";
  String agama = "GAMBNAR";
  String jk = "GAMBNAR";
  int no = 0;
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

  Future updateDataWilayah(Map<String, dynamic> updateInfo) async {
    return FirebaseFirestore.instance
        .collection("latarBelakang")
        .doc("sejarah")
        .update(updateInfo);
  }

  Future updateVisi(Map<String, dynamic> updateInfo) async {
    return FirebaseFirestore.instance
        .collection("visidanmisi")
        .doc("visi")
        .update(updateInfo);
  }

  Future updateMisi(Map<String, dynamic> updateInfo) async {
    return FirebaseFirestore.instance
        .collection("visidanmisi")
        .doc("misi")
        .update(updateInfo);
  }

  Future updateBiodata(String doc, Map<String, dynamic> updateInfo) async {
    return FirebaseFirestore.instance
        .collection("struktur")
        .doc(doc)
        .update(updateInfo);
  }

  getSejarah(editSejarah) {
    return this.sejarah = editSejarah;
  }

  getLuasWilayah(editLuas) {
    return this.sejarah = editLuas;
  }

  getRT(editJmlRT) {
    return this.sejarah = editJmlRT;
  }

  getLK(editJmlLK) {
    return this.sejarah = editJmlLK;
  }

  getPerbatasanUtara(editUtara) {
    return this.perbatasanUtara = editUtara;
  }

  getPerbatasanTimur(editTimur) {
    return this.perbatasanUtara = editTimur;
  }

  getPerbatasanSelatan(editSelatan) {
    return this.perbatasanUtara = editSelatan;
  }

  getPerbatasanBarat(editBarat) {
    return this.perbatasanUtara = editBarat;
  }

  getMisi(editMisi) {
    return this.misi = editMisi;
  }

  getVisi(editVisi) {
    return this.visi = editVisi;
  }

  getNama(editNama) {
    return this.nama = editNama;
  }

  getTTL(editTTL) {
    return this.ttl = editTTL;
  }

  getJabatan(editJabatan) {
    return this.jabatan = editJabatan;
  }

  getAgama(editAgama) {
    return this.agama = editAgama;
  }

  getJK(editJK) {
    return this.jk = editJK;
  }
}
