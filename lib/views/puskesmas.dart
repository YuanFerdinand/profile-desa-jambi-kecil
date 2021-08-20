import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/produk/data_kepala_keluarga_card.dart';
import 'package:profile_desa_jambi_kecil/produk/posyandu_card.dart';
import 'package:profile_desa_jambi_kecil/produk/puskesmas_card.dart';

class Puskesmas extends StatefulWidget {
  const Puskesmas({Key? key}) : super(key: key);

  @override
  _PuskesmasState createState() => _PuskesmasState();
}

class _PuskesmasState extends State<Puskesmas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "List Puskesmas",
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
                  .collection("puskesmas")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            (snapshot.data! as QuerySnapshot).docs[index];
                        return PuskesmasCard(
                          documentSnapshot["bidan"],
                          documentSnapshot["createdAt"],
                          documentSnapshot["dokter"],
                          documentSnapshot["nama"],
                          documentSnapshot["jml"],
                          documentSnapshot["tenagaKerja"],
                          documentSnapshot["perawat"],
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
