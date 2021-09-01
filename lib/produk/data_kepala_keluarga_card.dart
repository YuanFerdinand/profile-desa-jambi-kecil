import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/edit_kepala_keluarga.dart';

class DataKepalaKeluargaCard extends StatefulWidget {
  final int tahun;
  final int laki;
  final int perempuan;
  final int total;

  DataKepalaKeluargaCard(
    this.tahun,
    this.laki,
    this.perempuan,
    this.total,
  );

  @override
  _DataKepalaKeluargaCardState createState() => _DataKepalaKeluargaCardState();
}

class _DataKepalaKeluargaCardState extends State<DataKepalaKeluargaCard> {
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
          height: MediaQuery.of(context).size.height * 0.37,
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
                        widget.tahun.toString(),
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
                          "Kepala Keluarga (L) : " + widget.laki.toString(),
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
                          "Kepala Keluarga (P) : " +
                              widget.perempuan.toString(),
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
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Total Kepala Keluarga tahun " +
                              widget.tahun.toString() +
                              " : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    widget.total.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.green),
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
                                return EditKepalaKeluarga(
                                    widget.tahun,
                                    widget.laki,
                                    widget.perempuan,
                                    widget.total);
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
                              DatabaseMethods().deleteDataKepalaKeluarga(
                                  widget.tahun.toString());
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
