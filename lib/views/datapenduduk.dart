import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/produk/data_perkembangan_card.dart';

class DataPenduduk extends StatefulWidget {
  const DataPenduduk({Key? key}) : super(key: key);

  @override
  _DataPendudukState createState() => _DataPendudukState();
}

class _DataPendudukState extends State<DataPenduduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF0000),
        title: Text(
          "Data Penduduk",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.95,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("dataPenduduk")
                  .doc("dataPerkembangan")
                  .collection("dataPerkembangan")
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
                        return DataPerkembanganCard(
                          documentSnapshot["tahun"],
                          documentSnapshot["laki"],
                          documentSnapshot["perempuan"],
                          documentSnapshot["total"],
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
