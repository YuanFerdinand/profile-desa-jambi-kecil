import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/homepage.dart';

class EditFasilitasPendidikan extends StatefulWidget {
  final String doc;
  final String nama;
  final int jml;
  final int guru;
  final int siswa;

  EditFasilitasPendidikan(this.doc, this.nama, this.jml, this.guru, this.siswa);

  @override
  _EditFasilitasPendidikanState createState() =>
      _EditFasilitasPendidikanState();
}

class _EditFasilitasPendidikanState extends State<EditFasilitasPendidikan> {
  var guruController;
  var jmlController;
  var namaController;
  var siswaController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Form(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xff008000)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(
                      bottom: 5, // Space between underline and text
                    ),
                    // decoration: BoxDecoration(
                    //     border: Border(
                    //         bottom: BorderSide(
                    //   color: Color(0xff8142FC),
                    //   width: 5.0, // Underline thickness
                    // ))),
                    child: Text(
                      "EDIT FASILITAS PENDIDIKAN",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Popppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    //0xff2CCACA : 0xff5D11FF
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        SingleChildScrollView(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            onChanged: (editJml) {
                              jmlController = int.tryParse(
                                  DatabaseMethods().getRT(editJml));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Fasilitas",
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        SingleChildScrollView(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            onChanged: (editJmlSiswa) {
                              siswaController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlSiswa));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Siswa",
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        SingleChildScrollView(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            onChanged: (editJmlGuru) {
                              guruController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Guru",
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Navigator.pop(context);
                                Map<String, dynamic> updateDataSekolah = {
                                  "guru": (guruController),
                                  "jml": (jmlController) ?? widget.jml,
                                  "siswa": (siswaController) ?? widget.siswa,
                                };

                                DatabaseMethods().updateDataFasilitas(
                                    widget.doc, updateDataSekolah);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff008000),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Center(
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
