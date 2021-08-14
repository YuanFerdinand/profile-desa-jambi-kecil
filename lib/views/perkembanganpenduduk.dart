import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/produk/data_perkembangan_card.dart';

class PerkembanganPenduduk extends StatefulWidget {
  const PerkembanganPenduduk({Key? key}) : super(key: key);

  @override
  _PerkembanganPendudukState createState() => _PerkembanganPendudukState();
}

class _PerkembanganPendudukState extends State<PerkembanganPenduduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Perkembangan Penduduk",
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
