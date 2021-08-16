import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VisiMisi extends StatefulWidget {
  const VisiMisi({Key? key}) : super(key: key);

  @override
  _VisiMisiState createState() => _VisiMisiState();
}

class _VisiMisiState extends State<VisiMisi> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbvismisi = FirebaseFirestore.instance;
    CollectionReference visimisi = dbvismisi.collection('visidanmisi');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Visi dan Misi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff008000)
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: AssetImage("assets/visi.jpg"))
                    ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "VISI",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    StreamBuilder<DocumentSnapshot>(
                        stream: visimisi.doc('visi').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Container(
                              child: Text(
                                snapshot.data!['visi'],
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
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
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff008000)
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: AssetImage("assets/visi.jpg"))
                    ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "MISI",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    StreamBuilder<DocumentSnapshot>(
                        stream: visimisi.doc('misi').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Container(
                              child: Text(
                                "!. " + snapshot.data!['nomor1'],
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          else {
                            return Text("Mohon Tunggu");
                          }
                        }),
                    Text(" "),
                    StreamBuilder<DocumentSnapshot>(
                        stream: visimisi.doc('misi').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Container(
                              child: Text(
                                "2. " + snapshot.data!['nomor2'],
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          else {
                            return Text("Mohon Tunggu");
                          }
                        }),
                    Text(" "),
                    StreamBuilder<DocumentSnapshot>(
                        stream: visimisi.doc('misi').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Container(
                              child: Text(
                                "3. " + snapshot.data!['nomor3'],
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          else {
                            return Text("Mohon Tunggu");
                          }
                        }),
                    Text(" "),
                    StreamBuilder<DocumentSnapshot>(
                        stream: visimisi.doc('misi').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Container(
                              child: Text(
                                "4. " + snapshot.data!['nomor4'],
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          else {
                            return Text("Mohon Tunggu");
                          }
                        }),
                    Text(" "),
                    StreamBuilder<DocumentSnapshot>(
                        stream: visimisi.doc('misi').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return Container(
                              child: Text(
                                "5. " + snapshot.data!['nomor5'],
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
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
            ),
          ),
        ],
      ),
    );
  }
}
