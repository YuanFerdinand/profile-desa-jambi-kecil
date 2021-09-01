//import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/homepage.dart';

class EditSejarah extends StatefulWidget {
  final String imagePath;
  final String desk;

  EditSejarah(
    this.imagePath,
    this.desk,
  );
  @override
  _EditSejarahState createState() => _EditSejarahState();
}

class _EditSejarahState extends State<EditSejarah> {
  var imagePath;
  var sejarah;
  var imageDir;

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
                      "EDIT SEJARAH JAMBI KECIL",
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
                            onChanged: (editSejarah) {
                              sejarah =
                                  DatabaseMethods().getSejarah(editSejarah);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Deskripsi Sejarah",
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
                                Navigator.pop(context);

                                if (imageDir != null) {
                                  imagePath =
                                      await DatabaseMethods.uploadGambar(
                                          imageDir);
                                }
                                Map<String, dynamic> updateInfo = {
                                  "desk": sejarah ?? widget.desk,
                                  "gambar": imagePath ?? widget.imagePath,
                                };

                                DatabaseMethods().updateSejarah(updateInfo);
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
                                    "edit",
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
