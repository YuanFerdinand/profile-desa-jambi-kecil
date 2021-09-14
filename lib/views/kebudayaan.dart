import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/produk/data_kebudayaan_card.dart';
import 'package:profile_desa_jambi_kecil/produk/data_kesenian_card.dart';
import 'package:profile_desa_jambi_kecil/produk/data_perkembangan_card.dart';
import 'package:profile_desa_jambi_kecil/views/add_data_Kesenian.dart';
import 'package:profile_desa_jambi_kecil/views/add_data_kebudayaan.dart';
import 'package:profile_desa_jambi_kecil/views/add_perkembangan_penduduk.dart';

class KebudayaanPage extends StatefulWidget {
  const KebudayaanPage({Key? key}) : super(key: key);

  @override
  _KebudayaanPageState createState() => _KebudayaanPageState();
}

class _KebudayaanPageState extends State<KebudayaanPage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Kebudayaan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          (myUserName != "USERNAME")
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddDataKebudayaan();
                      }));
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.97,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("budaya")
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            (snapshot.data! as QuerySnapshot).docs[index];
                        return DataKebudayaanCard(
                          documentSnapshot["createdAt"],
                          documentSnapshot["desk"],
                          documentSnapshot["gambar"],
                          documentSnapshot["lastUpdateAt"],
                          documentSnapshot["nama"],
                          documentSnapshot["id"],
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
