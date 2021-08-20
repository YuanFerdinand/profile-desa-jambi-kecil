import 'package:flutter/material.dart';
import 'package:profile_desa_jambi_kecil/views/detail_akseptor.dart';

class DataKBCard extends StatefulWidget {
  final int akseptorKB;
  final int kondom;
  final int suntik;
  final int implan;
  final int pil;
  final int tahun;

  DataKBCard(
    this.akseptorKB,
    this.kondom,
    this.suntik,
    this.implan,
    this.pil,
    this.tahun,
  );

  @override
  _DataKBCardState createState() => _DataKBCardState();
}

class _DataKBCardState extends State<DataKBCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailAkseptor(widget.akseptorKB, widget.kondom, widget.suntik,
              widget.implan, widget.pil, widget.tahun);
        }));
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/backgroundkb.jpg"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TAHUN " + widget.tahun.toString(),
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
