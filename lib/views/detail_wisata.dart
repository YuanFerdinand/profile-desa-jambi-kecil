import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/edit_data_wisata.dart';

class DetailWisata extends StatefulWidget {
  final Timestamp createdAt;
  final String desk;
  final String gambar;
  final Timestamp lastUpdateAt;
  final String nama;
  final String id;

  DetailWisata(
    this.createdAt,
    this.desk,
    this.gambar,
    this.lastUpdateAt,
    this.nama,
    this.id,
  );
  @override
  _DetailWisataState createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
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
                        return EditDataWisata(
                          widget.createdAt,
                          widget.desk,
                          widget.gambar,
                          widget.lastUpdateAt,
                          widget.nama,
                          widget.id,
                        );
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
                      DatabaseMethods().deleteDataWisata(widget.id);
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
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
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
                  child: Center(
                      child: Text(
                    "Gambar Wisata " + widget.nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.desk,
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
