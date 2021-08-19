import 'package:flutter/material.dart';

class StrukturCard extends StatefulWidget {
  final String nama;
  final String ttl;
  final String jabatan;
  final String agama;
  final String jk;
  final int no;

  StrukturCard(this.nama, this.ttl, this.jabatan, this.agama, this.jk, this.no);
  @override
  _StrukturCardState createState() => _StrukturCardState();
}

class _StrukturCardState extends State<StrukturCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          top: MediaQuery.of(context).size.height * 0.03,
          right: MediaQuery.of(context).size.width * 0.03),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              width: 2,
              color: Color(0xff008000),
            )),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama : " + widget.nama,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Tanggal Lahir : " + widget.ttl,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Jabatan : " + widget.jabatan,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
