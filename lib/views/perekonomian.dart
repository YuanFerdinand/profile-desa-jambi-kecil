import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/views/edit_data_perekonomian.dart';

class DataPerekonomian extends StatefulWidget {
  const DataPerekonomian({Key? key}) : super(key: key);

  @override
  _DataPerekonomianState createState() => _DataPerekonomianState();
}

class _DataPerekonomianState extends State<DataPerekonomian> {
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
    FirebaseFirestore dbEkonomi = FirebaseFirestore.instance;
    CollectionReference ekonomi = dbEkonomi.collection('dataPenduduk');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff008000),
          title: Text(
            "Perekonomian",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            (myUserName != "USERNAME")
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StreamBuilder<DocumentSnapshot>(
                            stream: ekonomi.doc('dataPerekonomian').snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData)
                                return EditDataPerekonomian(
                                    snapshot.data!["pemilikBengkel"],
                                    snapshot.data!["pemilikMobil"],
                                    snapshot.data!["pemilikMotor"],
                                    snapshot.data!["pemilikParabola"],
                                    snapshot.data!["pemilikRumahPermanen"],
                                    snapshot.data!["pemilikRumahSemiPermanen"],
                                    snapshot.data!["pemilikTV"],
                                    snapshot.data!["pemilikTruk"],
                                    snapshot.data!["pemilikUsahaJahit"],
                                    snapshot.data!["pemilikUsahaTataRias"],
                                    snapshot.data!["pemilikWarung"]);
                              else {
                                return Text("Mohon Tunggu");
                              }
                            });
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.edit),
                    ),
                  )
                : SizedBox()
          ],
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.95,
            child: GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/bengkel.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Bengkel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data!['pemilikBengkel']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/mobil.png"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Mobil Pribadi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data!['pemilikMobil']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/motor.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Sepeda Motor",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data!['pemilikMotor']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/truk.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Truk",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data!['pemilikTruk']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/rumah.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Rumah Pribadi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data![
                                                        'pemilikRumahPermanen']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/kontrakan.png"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Semi Permanen",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data![
                                                        'pemilikRumahSemiPermanen']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/tv.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Televisi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data!['pemilikTV']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/antena.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Antena Parabola",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot
                                                    .data!['pemilikParabola']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/jahit.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Usaha Jahit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot
                                                    .data!['pemilikUsahaJahit']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/tatarias.jpg"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Usaha Tata Rias",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data![
                                                        'pemilikUsahaTataRias']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
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
                                  image: AssetImage("assets/warung.png"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                  child: Text(
                                "Warung",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: StreamBuilder<DocumentSnapshot>(
                                    stream: ekonomi
                                        .doc('dataPerekonomian')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Container(
                                          child: Text(
                                            "Warga yang memiliki :  " +
                                                snapshot.data!['pemilikWarung']
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        );
                                      else {
                                        return Text("Mohon Tunggu");
                                      }
                                    }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
