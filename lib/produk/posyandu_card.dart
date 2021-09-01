import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/edit_posyandu.dart';

class PosyanduCard extends StatefulWidget {
  final String id;
  final String lokasi;
  final String nama;
  final int petugas;

  PosyanduCard(
    this.id,
    this.lokasi,
    this.nama,
    this.petugas,
  );

  @override
  _PosyanduCardState createState() => _PosyanduCardState();
}

class _PosyanduCardState extends State<PosyanduCard> {
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
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.24,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 15, 5, 15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        widget.nama.toString(),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Lokasi : " + widget.lokasi.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Jumlah Petugas : " + widget.petugas.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                (myUserName != "USERNAME")
                    ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EditPosyandu(
                                  widget.lokasi,
                                  widget.nama,
                                  widget.id,
                                  widget.petugas,
                                );
                              }));
                            },
                            child: Icon(
                              Icons.update,
                              size: 40,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              DatabaseMethods().deletePosyandu(widget.nama);
                            },
                            child: Icon(
                              Icons.delete,
                              size: 40,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ])
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
