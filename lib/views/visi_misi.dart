import 'package:flutter/material.dart';

class VisiMisi extends StatefulWidget {
  const VisiMisi({Key? key}) : super(key: key);

  @override
  _VisiMisiState createState() => _VisiMisiState();
}

class _VisiMisiState extends State<VisiMisi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Visi dan Misi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
