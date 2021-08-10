import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WilayahPage extends StatefulWidget {
  const WilayahPage({Key? key}) : super(key: key);

  @override
  _WilayahPageState createState() => _WilayahPageState();
}

class _WilayahPageState extends State<WilayahPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbwilayah = FirebaseFirestore.instance;
    CollectionReference wilayah = dbwilayah.collection('luasWilayah');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF0000),
        title: Text(
          "Wilayah Desa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/wilayahpeta.PNG"))),
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: wilayah.doc('wilayah').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Luas Wilayah : " +
                          snapshot.data!['luas'].toString() +
                          " Km²",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  );
                else {
                  return Text("Mohon Tunggu");
                }
              }),
          StreamBuilder<DocumentSnapshot>(
              stream: wilayah.doc('lingkungan').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Jumlah LK : " + snapshot.data!['jml'].toString() + "LK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  );
                else {
                  return Text("Mohon Tunggu");
                }
              })
        ],
      ),
    );
  }
}
