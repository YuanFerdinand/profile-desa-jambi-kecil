import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/homepage.dart';

class EditDataKelurahan extends StatefulWidget {
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

  EditDataKelurahan(this.createdAt, this.ttl, this.gambar, this.lastUpdateAt,
      this.nama, this.id, this.jk, this.jabatan, this.agama, this.kode);
  @override
  _EditDataKelurahanState createState() => _EditDataKelurahanState();
}

class _EditDataKelurahanState extends State<EditDataKelurahan> {
  var imagePath;
  var deskController;
  var nama;
  var imageDir;
  var jk;
  var jabatan;
  var agama;
  var ttl;
  var _chosenValue1;
  var _chosenValue2;
  var kode;

  Future<File> getImage() async {
    var imageFile;
    final picker = ImagePicker();
    PickedFile? pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      return imageDir = imageFile;
    } else {
      return imageDir = imageFile;
    }
  }

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
                      "EDIT BIODATA",
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
                            maxLines: null,
                            onChanged: (editNama) {
                              nama = (DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Nama",
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
                            maxLines: null,
                            onChanged: (editNama) {
                              ttl = (DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Tempat dan Tanggal Lahir",
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
                            maxLines: null,
                            onChanged: (editNama) {
                              agama = (DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Agama",
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
                            maxLines: null,
                            onChanged: (editNama) {
                              jk = (DatabaseMethods().getRT(editNama));
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Jenis Kelamin",
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration.collapsed(hintText: ''),
                          validator: (value) =>
                              value == null ? 'Jabatan Belum Dipilih' : null,
                          value: _chosenValue1,
                          items: [
                            'Lurah',
                            'Sekretaris Kelurahan',
                            'Kasi Kesos dan Pelum',
                            'Kasi Pem dan Pembangunan',
                            'Kasi Trantib',
                            'Tks',
                            'Fungsional Umum',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          hint: Text("Pilih Jabatan"),
                          onChanged: (value) {
                            setState(() {
                              _chosenValue1 = value;
                              this.jabatan = _chosenValue1;
                            });
                          },
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration.collapsed(hintText: ''),
                          validator: (value) => value == null
                              ? 'Kode jabatan belum dipilih'
                              : null,
                          value: _chosenValue2,
                          items: [
                            '1 (Untuk Jabatan Lurah)',
                            '2 (Untuk Jabatan Sekretaris Lurah)',
                            '3 (Untuk Jabatan Kasi Kesos dan Pelum)',
                            '4 (Untuk Jabatan Kasi Pem dan Pembangunan)',
                            '5 (Untuk Jabatan Kasi Trantib)',
                            '6 (Untuk Jabatan Tks)',
                            '7 (Untuk Jabatan Fungsional Umum)',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          hint: Text("Pilih Kode Jabatan"),
                          onChanged: (value) {
                            setState(() {
                              _chosenValue2 = value;
                              this.kode = int.tryParse(
                                  _chosenValue2.toString().substring(0, 1));
                            });
                          },
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff008000),
                                    borderRadius: BorderRadius.circular(50)),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: (imageDir == null)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Upload file",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                          IconButton(
                                              icon: Icon(Icons.upload_file),
                                              color: Colors.white,
                                              iconSize: 30,
                                              onPressed: () {
                                                getImage();
                                              })
                                        ],
                                      )
                                    : Text(
                                        imageDir.toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      )),
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));

                                if (imageDir != null) {
                                  imagePath =
                                      await DatabaseMethods.uploadGambar(
                                          imageDir);
                                }
                                Map<String, dynamic> updateInfo = {
                                  "kode": kode ?? widget.kode,
                                  "nama": nama ?? widget.nama,
                                  "lastUpdateAt": DateTime.now(),
                                  "gambar": imagePath ?? widget.gambar,
                                  "jk": jk ?? widget.jk,
                                  "jabatan": jabatan ?? widget.jabatan,
                                  "agama": agama ?? widget.agama,
                                  "TTL": ttl ?? widget.ttl,
                                };

                                DatabaseMethods().updateDataPerangkatKelurahan(
                                    widget.id, updateInfo);
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
