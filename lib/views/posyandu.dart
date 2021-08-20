import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/produk/data_kepala_keluarga_card.dart';
import 'package:profile_desa_jambi_kecil/produk/posyandu_card.dart';

class Posyandu extends StatefulWidget {
  const Posyandu({Key? key}) : super(key: key);

  @override
  _PosyanduState createState() => _PosyanduState();
}

class _PosyanduState extends State<Posyandu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "List Posyandu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.97,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("kesejahteraanMasyarakat")
                  .doc("kesehatan")
                  .collection("posyandu")
                  .doc('posyandu')
                  .collection('listPosyandu')
                  .orderBy('id', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            (snapshot.data! as QuerySnapshot).docs[index];
                        return PosyanduCard(
                          documentSnapshot["id"],
                          documentSnapshot["lokasi"],
                          documentSnapshot["nama"],
                          documentSnapshot["petugas"],
                        );
                      });
                } else {
                  return Center(
                      child: Text(
                    'Belum ada data',
                    style: TextStyle(fontFamily: "RedHatDisplay", fontSize: 15),
                  ));
                }
              }),
        ),
      ),
    );
  }
}
