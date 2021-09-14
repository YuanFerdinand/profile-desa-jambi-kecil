import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:form_field_validator/form_field_validator.dart";

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var email;
  final auth = FirebaseAuth.instance;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff008000),
      body: Stack(children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: EdgeInsets.only(top: 150, left: 15, right: 15),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.20,
                  color: Colors.white38,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                              fontFamily: "RedHatDisplay"),
                        ),
                      ),
                      SizedBox(
                          height: 80,
                          child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Email harus diisi'),
                              EmailValidator(errorText: 'Email tidak valid')
                            ]),
                            autocorrect: true,
                            // autofocus: true,

                            cursorColor: Colors.black,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              setState(() {
                                email = value.trim();
                              });
                            },
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontFamily: "PublicSans",
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none),
                          )),
                    ],
                  ),
                ),
                Container(
                  // alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 325),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 230,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print('Validated');
                              // AuthMethods().signIn(email, password, context);
                              auth.sendPasswordResetEmail(email: email);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text('Buka email'),
                                      content: SizedBox(
                                        height: 130,
                                        child: Column(
                                          children: [
                                            Text(
                                                'Klik link yang dikirim ke email'),
                                            Text('$email'),
                                            Text('untuk mengubah password'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            //
                                          },
                                          child: Text(
                                            'Ya',
                                            style: TextStyle(
                                                color: Color(0xff008000),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              print('Not Validated');
                            }
                          },
                          child: Center(
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                  color: Color(0xff008000),
                                  fontFamily: "PublicSans",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
