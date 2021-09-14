import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/edit_data_kebudayaan.dart';
import 'package:profile_desa_jambi_kecil/views/edit_data_kelurahan.dart';

class DetailBiodata extends StatefulWidget {
  final Timestamp createdAt;
  final String ttl;
  final String gambar;
  final Timestamp lastUpdateAt;
  final String nama;
  final String id;
  final String jk;
  final String jabatan;
  final String agama;
  final int kode;

  DetailBiodata(
    this.createdAt,
    this.ttl,
    this.gambar,
    this.lastUpdateAt,
    this.nama,
    this.id,
    this.jk,
    this.jabatan,
    this.agama,
    this.kode,
  );
  @override
  _DetailBiodataState createState() => _DetailBiodataState();
}

class _DetailBiodataState extends State<DetailBiodata> {
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
        title: Text(
          widget.nama,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff008000),
        actions: [
          (myUserName != "USERNAME")
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditDataKelurahan(
                            widget.createdAt,
                            widget.ttl,
                            widget.gambar,
                            widget.lastUpdateAt,
                            widget.nama,
                            widget.id,
                            widget.jk,
                            widget.jabatan,
                            widget.agama,
                            widget.kode);
                      }));
                    },
                    child: Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                )
              : SizedBox(),
          (myUserName != "USERNAME")
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      DatabaseMethods().deleteDataPerangkatKelurahan(widget.id);
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
      body: Container(
        color: Color(0xff008000),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: (widget.gambar != "GAMBAR")
                          ? DecorationImage(
                              image: NetworkImage(widget.gambar),
                              fit: BoxFit.cover)
                          : DecorationImage(
                              image: AssetImage("assets/no_image.png"),
                              fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nama : " + widget.nama,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Jabatan : " + widget.jabatan,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Agama : " + widget.agama,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tempat Tanggal Lahir : " + widget.ttl,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Jenis Kelamin : " + widget.jk,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 8, right: 8),
                  child: Text(
                    "Diposting pada : " +
                        widget.createdAt.toDate().toString().substring(0, 11),
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Update terakhir pada : " +
                        widget.lastUpdateAt
                            .toDate()
                            .toString()
                            .substring(0, 11),
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
