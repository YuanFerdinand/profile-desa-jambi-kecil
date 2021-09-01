import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/homepage.dart';

class EditDataKB extends StatefulWidget {
  final int akseptorKB;
  final int penggunaAlatKontrasepsiKondom;
  final int penggunaAlatKontrasepsiSuntik;
  final int penggunaKontrasepsiImplan;
  final int penggunaKontrasepsiPil;
  final int tahun;

  EditDataKB(
    this.akseptorKB,
    this.penggunaAlatKontrasepsiKondom,
    this.penggunaAlatKontrasepsiSuntik,
    this.penggunaKontrasepsiImplan,
    this.penggunaKontrasepsiPil,
    this.tahun,
  );
  @override
  _EditDataKBState createState() => _EditDataKBState();
}

class _EditDataKBState extends State<EditDataKB> {
  var akseptorKBController;
  var penggunaAlatKontrasepsiKondomController;
  var penggunaAlatKontrasepsiSuntikController;
  var penggunaKontrasepsiImplanController;
  var penggunaKontrasepsiPilController;
  var tahunController;

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
                      "EDIT DATA KB",
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
                        SingleChildScrollView(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            onChanged: (editNama) {
                              akseptorKBController = int.tryParse(
                                  DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Akseptor KB",
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
                            onChanged: (editNama) {
                              penggunaAlatKontrasepsiKondomController =
                                  int.tryParse(
                                      DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pengguna Kondom",
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
                            onChanged: (editNama) {
                              penggunaAlatKontrasepsiSuntikController =
                                  int.tryParse(
                                      DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pengguna Kontrasepsi Suntik",
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
                            onChanged: (editNama) {
                              penggunaKontrasepsiImplanController =
                                  int.tryParse(
                                      DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pengguna Kontrasepsi Implan",
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
                            onChanged: (editNama) {
                              penggunaKontrasepsiPilController = int.tryParse(
                                  DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pengguna Kontrasepsi Pil",
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
                            onChanged: (editNama) {
                              tahunController = int.tryParse(
                                  DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Tahun",
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
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));

                                Map<String, dynamic> addData = {
                                  "akseptorKB":
                                      akseptorKBController ?? widget.akseptorKB,
                                  "penggunaAlatKontrasepsiKondom":
                                      penggunaAlatKontrasepsiKondomController ??
                                          widget.penggunaAlatKontrasepsiKondom,
                                  "penggunaAlatKontrasepsiSuntik":
                                      penggunaAlatKontrasepsiSuntikController ??
                                          widget.penggunaAlatKontrasepsiSuntik,
                                  "penggunaKontrasepsiImplan":
                                      penggunaKontrasepsiImplanController ??
                                          widget.penggunaKontrasepsiImplan,
                                  "penggunaKontrasepsiPil":
                                      penggunaKontrasepsiPilController ??
                                          widget.penggunaKontrasepsiPil,
                                  "tahun": tahunController ?? widget.tahun,
                                };

                                DatabaseMethods().editdataKB(
                                    widget.tahun.toString(), addData);
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
                                    "SIMPAN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            )
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
