import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/produk/struktur_card.dart';
import 'package:profile_desa_jambi_kecil/views/edit_biodata.dart';

class StrukturPage extends StatefulWidget {
  const StrukturPage({Key? key}) : super(key: key);

  @override
  _StrukturPageState createState() => _StrukturPageState();
}

@override
class _StrukturPageState extends State<StrukturPage> {
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

  Widget build(BuildContext context) {
    FirebaseFirestore dbstruktur = FirebaseFirestore.instance;
    CollectionReference struktur = dbstruktur.collection('struktur');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Struktur",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('lurah').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "lurah",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/lurah.png"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('lurah').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('sekretaris').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "sekretaris",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/sekretaris.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('sekretaris').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('kasiKesos').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "kasiKesos",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/kasikesos.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('kasiKesos').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('kasiPem').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "kasiPem",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/kasipem.png"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('kasiPem').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('kasiTrantib').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "kasiTrantib",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/kasitrantib.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('kasiTrantib').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('FU1').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "FU1",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/fungsional.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('FU1').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('FU2').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "FU2",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/fungsional.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('FU2').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('FU3').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "FU3",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/fungsional.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('FU3').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('FU4').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "FU4",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/fungsional.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('FU4').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('Tks1').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "Tks1",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/tks.png"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('Tks1').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: struktur.doc('Tks2').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return EditBiodata(
                          "Tks2",
                          snapshot.data!["nama"],
                          snapshot.data!["TTL"],
                          snapshot.data!["jabatan"],
                          snapshot.data!["agama"],
                          snapshot.data!["jk"],
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    });
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/tks.png"),
                              fit: BoxFit.contain)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: StreamBuilder<DocumentSnapshot>(
                              stream: struktur.doc('Tks2').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama : " +
                                            snapshot.data!['nama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Tanggal Lahir : " +
                                            snapshot.data!['TTL'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jabatan : " +
                                            snapshot.data!['jabatan']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Agama : " +
                                            snapshot.data!['agama'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Jenis Kelamin : " +
                                            snapshot.data!['jk'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              }),
                        ),
                      ],
                    )
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
