import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/produk/data_kepala_keluarga_card.dart';
import 'package:profile_desa_jambi_kecil/produk/data_perkembangan_card.dart';

class DataPerekonomian extends StatefulWidget {
  const DataPerekonomian({Key? key}) : super(key: key);

  @override
  _DataPerekonomianState createState() => _DataPerekonomianState();
}

class _DataPerekonomianState extends State<DataPerekonomian> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbEkonomi = FirebaseFirestore.instance;
    CollectionReference ekonomi = dbEkonomi.collection('dataPenduduk');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff008000),
          title: Text(
            "Data Perekonomian",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Warga yang memiliki bengkel ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki bengkel " +
                                            snapshot.data!['pemilikBengkel']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: StreamBuilder<DocumentSnapshot>(
                                  stream: ekonomi
                                      .doc('dataPerekonomian')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData)
                                      return Container(
                                        child: Text(
                                          "Warga yang memiliki Mobil Pribadi " +
                                              snapshot.data!['pemilikMobil']
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    else {
                                      return Text("Mohon Tunggu");
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: StreamBuilder<DocumentSnapshot>(
                                  stream: ekonomi
                                      .doc('dataPerekonomian')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData)
                                      return Container(
                                        child: Text(
                                          "Warga yang memiliki Sepeda Motor " +
                                              snapshot.data!['pemilikMotor']
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    else {
                                      return Text("Mohon Tunggu");
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: StreamBuilder<DocumentSnapshot>(
                                  stream: ekonomi
                                      .doc('dataPerekonomian')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData)
                                      return Container(
                                        child: Text(
                                          "Warga yang memiliki parabola " +
                                              snapshot.data!['pemilikParabola']
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      );
                                    else {
                                      return Text("Mohon Tunggu");
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki Rumah Permanen " +
                                            snapshot
                                                .data!['pemilikRumahPermanen']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki Rumah Semi Permanen " +
                                            snapshot.data![
                                                    'pemilikRumahSemiPermanen']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki Televisi : " +
                                            snapshot.data!['pemilikTV']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki Mobil Truk " +
                                            snapshot.data!['pemilikTruk']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki Usaha Jahit " +
                                            snapshot.data!['pemilikUsahaJahit']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki Usaha Tata Rias : " +
                                            snapshot
                                                .data!['pemilikUsahaTataRias']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                                stream:
                                    ekonomi.doc('dataPerekonomian').snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData)
                                    return Container(
                                      child: Text(
                                        "Warga yang memiliki Warung " +
                                            snapshot.data!['pemilikWarung']
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  else {
                                    return Text("Mohon Tunggu");
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
