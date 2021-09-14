import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';

class AddPerangkatKelurahan extends StatefulWidget {
  @override
  _AddPerangkatKelurahanState createState() => _AddPerangkatKelurahanState();
}

class _AddPerangkatKelurahanState extends State<AddPerangkatKelurahan> {
  var namaController;
  var imagePath;
  var imageDir;
  var ttlController;
  var kodeController;
  var jkController;
  var jabatanController;
  var agamaController;
  var _chosenValue1;
  var _chosenValue2;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
                      "TAMBAH DATA",
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
                              namaController =
                                  (DatabaseMethods().getRT(editNama));
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
                              ttlController =
                                  (DatabaseMethods().getRT(editNama));
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
                              agamaController =
                                  (DatabaseMethods().getRT(editNama));
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
                              jkController =
                                  (DatabaseMethods().getRT(editNama));
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
                              this.jabatanController = _chosenValue1;
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
                            '1 (Lurah)',
                            '2 (Sekretaris Lurah)',
                            '3 (Kasi Kesos dan Pelum)',
                            '4 (Kasi Pem dan Pembangunan)',
                            '5 (Kasi Trantib)',
                            '6 (Tks)',
                            '7 (Fungsional Umum)',
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
                              this.kodeController = int.tryParse(
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
                                          Text("Upload Gambar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12)),
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
                                Navigator.pop(context);
                                if (imageDir != null) {
                                  imagePath =
                                      await DatabaseMethods.uploadGambar(
                                          imageDir);
                                }
                                String random = getRandomString(25);
                                Map<String, dynamic> addData = {
                                  "kode": kodeController ?? 0,
                                  "nama": namaController ?? "Kosong",
                                  "createdAt": DateTime.now(),
                                  "lastUpdateAt": DateTime.now(),
                                  "gambar": imagePath ?? "GAMBAR",
                                  "id": random,
                                  "jk": jkController,
                                  "jabatan": jabatanController,
                                  "agama": agamaController,
                                  "TTL": ttlController,
                                };

                                DatabaseMethods()
                                    .addDataPerangkatKelurahan(random, addData);
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
