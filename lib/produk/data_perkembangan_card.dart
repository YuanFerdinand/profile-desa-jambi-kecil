import 'package:flutter/material.dart';

class DataPerkembanganCard extends StatefulWidget {
  final int tahun;
  final int laki;
  final int perempuan;
  final int total;

  DataPerkembanganCard(
    this.tahun,
    this.laki,
    this.perempuan,
    this.total,
  );

  @override
  _DataPerkembanganCardState createState() => _DataPerkembanganCardState();
}

class _DataPerkembanganCardState extends State<DataPerkembanganCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/latar.jpeg"),
                  fit: BoxFit.fitWidth)),
        ),
      ),
    );
  }
}
