import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/views/detail_kesenian.dart';

class DataKesenianCard extends StatefulWidget {
  final Timestamp createdAt;
  final String desk;
  final String gambar;
  final Timestamp lastUpdateAt;
  final String nama;
  final String id;

  DataKesenianCard(
    this.createdAt,
    this.desk,
    this.gambar,
    this.lastUpdateAt,
    this.nama,
    this.id,
  );

  @override
  _DataKesenianCardState createState() => _DataKesenianCardState();
}

class _DataKesenianCardState extends State<DataKesenianCard> {
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
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return DetailKesenian(widget.createdAt, widget.desk, widget.gambar,
              widget.lastUpdateAt, widget.nama, widget.id);
        }));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          image: (widget.gambar != "GAMBAR")
                              ? DecorationImage(
                                  image: NetworkImage(widget.gambar),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image: AssetImage("assets/no_image.png"),
                                  fit: BoxFit.cover))),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Color(0xff008000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Center(
                      child: Text(
                        widget.nama,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
