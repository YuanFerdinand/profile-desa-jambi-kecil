import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/views/edit_pembangunan.dart';

class PembangunanPage extends StatefulWidget {
  const PembangunanPage({Key? key}) : super(key: key);

  @override
  _PembangunanPageState createState() => _PembangunanPageState();
}

class _PembangunanPageState extends State<PembangunanPage> {
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
    FirebaseFirestore dbSejarah = FirebaseFirestore.instance;
    CollectionReference sejarah =
        dbSejarah.collection('pembangunanDanPemberdayaan');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Pembangunan",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          (myUserName != "USERNAME")
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return StreamBuilder<DocumentSnapshot>(
                              stream: sejarah.doc('pembangunan').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return EditPembangunan(
                                    snapshot.data!["gambar"],
                                    snapshot.data!["desk"],
                                  );
                                else {
                                  return Text("Mohon Tunggu");
                                }
                              });
                        }));
                      },
                      child: Icon(Icons.edit)),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                StreamBuilder<DocumentSnapshot>(
                    stream: sejarah.doc('pembangunan').snapshots(),
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
                    stream: sejarah.doc('pembangunan').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            snapshot.data!['desk'].toString(),
                            style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}
