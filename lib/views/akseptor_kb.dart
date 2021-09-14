import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/produk/data_kb_card.dart';

class AkseptorKB extends StatefulWidget {
  const AkseptorKB({Key? key}) : super(key: key);

  @override
  _AkseptorKBState createState() => _AkseptorKBState();
}

class _AkseptorKBState extends State<AkseptorKB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "KB Penduduk",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.97,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("dataPenduduk")
                  .doc("dataKB")
                  .collection("dataKB")
                  .orderBy('tahun', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            (snapshot.data! as QuerySnapshot).docs[index];
                        return DataKBCard(
                          documentSnapshot["akseptorKB"],
                          documentSnapshot["penggunaAlatKontrasepsiKondom"],
                          documentSnapshot["penggunaAlatKontrasepsiSuntik"],
                          documentSnapshot["penggunaKontrasepsiImplan"],
                          documentSnapshot["penggunaKontrasepsiPil"],
                          documentSnapshot["tahun"],
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
