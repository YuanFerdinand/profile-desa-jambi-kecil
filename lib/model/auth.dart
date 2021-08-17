import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profile_desa_jambi_kecil/helper/shared_preference.dart';
import 'package:profile_desa_jambi_kecil/model/database.dart';
import 'package:profile_desa_jambi_kecil/views/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  Future signUp(String email, String password, String username,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? userDetail = userCredential.user;

      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        Map<String, dynamic> userInfoMap = {
          "email": email,
          "name": username,
          "role": "admin",
          "UID": userDetail!.uid,
        };
        DatabaseMethods()
            .tambahInfoAkun(userDetail.uid, userInfoMap)
            .then((value) {
          Navigator.pop(context);
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal membuat akun'),
              content: Text('Email tersebut sudah terdaftar'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    //
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? userDetail = userCredential.user;

      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserInfo(userDetail!.email);

      SharedPreferenceHelper().saveUserEmail(userDetail.email);
      SharedPreferenceHelper().saveUserCredentialId(userDetail.uid);
      SharedPreferenceHelper().saveUserName(querySnapshot.docs[0]['name']);
      SharedPreferenceHelper().saveRole(querySnapshot.docs[0]['role']);

      // myBool = await SharedPreferenceHelper().getLogedIn();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal masuk'),
              content: Text('Email tidak ditemukan'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal masuk'),
              content: Text('Password salah'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future toSignOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    auth.signOut();
    preferences.clear();
    Future.delayed(const Duration(milliseconds: 500), () {
      RestartWidget.restartApp(context);
    });

    //return new LoginPage();
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
