import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/homepage.dart';

class AddPuskesmas extends StatefulWidget {
  @override
  _AddPuskesmasState createState() => _AddPuskesmasState();
}

class _AddPuskesmasState extends State<AddPuskesmas> {
  var dokterController;
  var namaController;
  var bidanController;
  var tenagaKerjaController;
  var perawatController;
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
                      "TAMBAH PUSKESMAS",
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
                            maxLines: null,
                            onChanged: (editNama) {
                              namaController =
                                  DatabaseMethods().getRT(editNama);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Nama Puskesmas",
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
                            onChanged: (editTenagaKerja) {
                              tenagaKerjaController = int.tryParse(
                                  DatabaseMethods().getRT(editTenagaKerja));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Tenaga Kerja",
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
                            onChanged: (editDokter) {
                              dokterController = int.tryParse(
                                  DatabaseMethods().getRT(editDokter));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Dokter",
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
                            onChanged: (editBidan) {
                              bidanController = int.tryParse(
                                  DatabaseMethods().getRT(editBidan));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Bidan",
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
                            onChanged: (editPerawat) {
                              perawatController = int.tryParse(
                                  DatabaseMethods().getRT(editPerawat));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Perawat",
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

                                Map<String, dynamic> addPuskesmas = {
                                  "nama": namaController,
                                  "dokter": dokterController,
                                  "bidan": bidanController,
                                  "perawat": perawatController,
                                  "tenagaKerja": tenagaKerjaController,
                                  "createdAt": DateTime.now(),
                                  "id": namaController,
                                };

                                DatabaseMethods()
                                    .addPuskesmas(namaController, addPuskesmas);
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
                                    "TAMBAH",
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
