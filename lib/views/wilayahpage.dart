import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/views/edit_wilayah.dart';

class WilayahPage extends StatefulWidget {
  const WilayahPage({Key? key}) : super(key: key);

  @override
  _WilayahPageState createState() => _WilayahPageState();
}

class _WilayahPageState extends State<WilayahPage> {
  String myUserName = "USERNAME";
  String myEmail = "USERNAME";
  String myUserCredential = "USERNAME";
  String myRole = "USERNAME";
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myUserName = (await SharedPreferenceHelper().getUserName()) ?? "USERNAME";
    myEmail = (await SharedPreferenceHelper().getUserEmail()) ?? "USERNAME";
    myUserCredential =
        (await SharedPreferenceHelper().getUserCredentialId()) ?? "USERNAME";
    myRole = (await SharedPreferenceHelper().getRole()) ?? "USERNAME";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbwilayah = FirebaseFirestore.instance;
    CollectionReference wilayah = dbwilayah.collection('luasWilayah');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Wilayah Desa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          (myUserName != "USERNAME")
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditWilayah();
                        }));
                      },
                      child: Icon(Icons.edit)),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                )
        ],
      ),
      body: Card(
        elevation: 25,
        child: ListView(
          children: [
            StreamBuilder<DocumentSnapshot>(
                stream: wilayah.doc('wilayah').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.only(top: 15),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data!['gambar']),
                              fit: BoxFit.fill)),
                    );
                  else {
                    return Text("Mohon Tunggu");
                  }
                }),
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
                stream: wilayah.doc('wilayah').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Jumlah LK : " + snapshot.data!['lk'].toString() + "LK",
                        style: TextStyle(
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
                stream: wilayah.doc('wilayah').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Jumlah RT : " +
                            snapshot.data!['rt'].toString() +
                            " RT",
                        style: TextStyle(
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
                stream: wilayah.doc('wilayah').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Perbatasan Utara : " +
                            snapshot.data!['utara'].toString(),
                        style: TextStyle(
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
                stream: wilayah.doc('wilayah').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Perbatasan Timur : " +
                            snapshot.data!['timur'].toString(),
                        style: TextStyle(
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
                stream: wilayah.doc('wilayah').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Perbatasan Selatan : " +
                            snapshot.data!['selatan'].toString(),
                        style: TextStyle(
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
                stream: wilayah.doc('wilayah').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        "Perbatasan Barat : " +
                            snapshot.data!['barat'].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
    );
  }
}
