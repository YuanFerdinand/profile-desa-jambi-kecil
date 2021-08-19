import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/model/auth.dart';
import 'package:profile_desa_jambi_kecil/views/datapenduduk.dart';
import 'package:profile_desa_jambi_kecil/views/login_page.dart';
import 'package:profile_desa_jambi_kecil/views/sejarah.dart';
import 'package:profile_desa_jambi_kecil/views/strukturpage.dart';
import 'package:profile_desa_jambi_kecil/views/visi_misi.dart';
import 'package:profile_desa_jambi_kecil/views/wilayahpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myUserName = "USERNAME";
  String myEmail = "USERNAME";
  String myUserCredential = "USERNAME";
  String myRole = "USERNAME";
  @override
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
          "Profile Desa",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Color(0xff008000),
        actions: [
          (myRole != "admin")
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Text("Masuk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  )),
                )
              : GestureDetector(
                  onTap: () {
                    Auth().toSignOut(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.logout),
                  ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/kelompok.jpeg"),
                              fit: BoxFit.fitWidth)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff008000)),
                          child: Center(
                            child: Text(
                              "Sakit Samo Diubat, Pening Samo Diureh",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WilayahPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/kerinci.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Color(0xff008000)),
                                child: Center(
                                  child: Text(
                                    "Wilayah Desa",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return VisiMisi();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/visimisi.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Color(0xff008000)),
                                child: Center(
                                  child: Text(
                                    "Visi Dan Misi",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SejarahPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/candi.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Color(0xff008000)),
                                child: Center(
                                  child: Text(
                                    "Sejarah",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StrukturPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/struktur.png"),
                                    fit: BoxFit.fill)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Color(0xff008000)),
                                child: Center(
                                  child: Text(
                                    "Struktur",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 15,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/fasilitas.jpg"),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color(0xff008000)),
                              child: Center(
                                child: Text(
                                  "Fasilitas",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DataPenduduk();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/penduduk.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Color(0xff008000)),
                                child: Center(
                                  child: Text(
                                    "Data Penduduk",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
