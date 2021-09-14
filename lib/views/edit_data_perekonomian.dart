import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';

class EditDataPerekonomian extends StatefulWidget {
  final int pemilikBengkel;
  final int pemilikMobil;
  final int pemilikMotor;
  final int pemilikParabola;
  final int pemilikRumahPermanen;
  final int pemilikRumahSemiPermanen;
  final int pemilikTV;
  final int pemilikTruk;
  final int pemilikUsahaJahit;
  final int pemilikUsahaTataRias;
  final int pemilikWarung;

  EditDataPerekonomian(
      this.pemilikBengkel,
      this.pemilikMobil,
      this.pemilikMotor,
      this.pemilikParabola,
      this.pemilikRumahPermanen,
      this.pemilikRumahSemiPermanen,
      this.pemilikTV,
      this.pemilikTruk,
      this.pemilikUsahaJahit,
      this.pemilikUsahaTataRias,
      this.pemilikWarung);

  @override
  _EditDataPerekonomianState createState() => _EditDataPerekonomianState();
}

class _EditDataPerekonomianState extends State<EditDataPerekonomian> {
  var pemilikBengkelController;
  var pemilikMobilController;
  var pemilikMotorController;
  var pemilikParabolaController;
  var pemilikRumahPermanenController;
  var pemilikRumahSemiPermanenController;
  var pemilikTVController;
  var pemilikTrukController;
  var pemilikUsahaJahitController;
  var pemilikUsahaTataRiasController;
  var pemilikWarungController;
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
                      "EDIT DATA PEREKONOMIAN",
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
                              pemilikBengkelController = int.tryParse(
                                  DatabaseMethods().getRT(editJml));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Bengkel",
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
                              pemilikMobilController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlSiswa));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Mobil",
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
                              pemilikMotorController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Motor",
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
                              pemilikParabolaController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Parabola",
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
                              pemilikRumahPermanenController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Rumah Permanen",
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
                              pemilikRumahSemiPermanenController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Rumah Semi Permanen",
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
                              pemilikTVController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik TV",
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
                              pemilikTrukController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Truk",
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
                              pemilikUsahaJahitController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Usaha Jahit",
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
                              pemilikUsahaTataRiasController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Usaha Tata Rias",
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
                              pemilikWarungController = int.tryParse(
                                  DatabaseMethods().getRT(editJmlGuru));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jumlah Pemilik Warung",
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
                                Map<String, dynamic> updateDataFasilitas = {
                                  "pemilikBengkel":
                                      (pemilikBengkelController) ??
                                          widget.pemilikBengkel,
                                  "pemilikMobil": (pemilikMobilController) ??
                                      widget.pemilikMobil,
                                  "pemilikMotor": (pemilikMotorController) ??
                                      widget.pemilikMotor,
                                  "pemilikParabola":
                                      (pemilikParabolaController) ??
                                          widget.pemilikParabola,
                                  "pemilikRumahPermanen":
                                      (pemilikRumahPermanenController) ??
                                          widget.pemilikRumahPermanen,
                                  "pemilikRumahSemiPermanen":
                                      (pemilikRumahSemiPermanenController) ??
                                          widget.pemilikRumahSemiPermanen,
                                  "pemilikTV":
                                      (pemilikTVController) ?? widget.pemilikTV,
                                  "pemilikTruk": (pemilikTrukController) ??
                                      widget.pemilikTruk,
                                  "pemilikUsahaJahit":
                                      (pemilikUsahaJahitController) ??
                                          widget.pemilikUsahaTataRias,
                                  "pemilikUsahaTataRias":
                                      (pemilikUsahaTataRiasController) ??
                                          widget.pemilikUsahaTataRias,
                                  "pemilikWarung": (pemilikWarungController) ??
                                      widget.pemilikWarung,
                                };

                                DatabaseMethods().updateDataPerekonomian(
                                    updateDataFasilitas);
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
