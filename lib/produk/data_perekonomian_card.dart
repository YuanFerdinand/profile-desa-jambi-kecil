import 'package:flutter/material.dart';

class DataPerekonomianCard extends StatefulWidget {
  final int pemilikBengkel;
  final int pemilikMobil;
  final int pemilikMotor;
  final int pemilikParabola;
  final int pemilikRumahPermanen;
  final int pemilikRumahSemiPermanen;
  final int pemilikTV;
  final int pemilikTruk;
  final int pemilikUsahaJahit;
  final int pemilikUsahaTataRias;
  final int pemilikWarung;

  DataPerekonomianCard(
      this.pemilikBengkel,
      this.pemilikMobil,
      this.pemilikMotor,
      this.pemilikParabola,
      this.pemilikRumahPermanen,
      this.pemilikRumahSemiPermanen,
      this.pemilikTV,
      this.pemilikTruk,
      this.pemilikUsahaJahit,
      this.pemilikUsahaTataRias,
      this.pemilikWarung);

  @override
  _DataPerekonomianCardState createState() => _DataPerekonomianCardState();
}

class _DataPerekonomianCardState extends State<DataPerekonomianCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(top: 15),
        // child: Card(
        //   elevation: 10,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //   child: Container(
        //     height: MediaQuery.of(context).size.height * 0.9,
        //     width: MediaQuery.of(context).size.width * 0.9,
        //     child: Container(
        //       margin: EdgeInsets.fromLTRB(0, 15, 5, 15),
        //       child: Column(
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(left: 15),
        //             child: Row(
        //               children: [
        //                 Text(
        //                   widget.tahun.toString(),
        //                   style: TextStyle(
        //                       fontSize: 24,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.black),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(left: 15),
        //             child: Row(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(top: 10),
        //                   child: Text(
        //                     "Kepala Keluarga (L) : " + widget.laki.toString(),
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(left: 15),
        //             child: Row(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(top: 10),
        //                   child: Text(
        //                     "Kepala Keluarga (P) : " +
        //                         widget.perempuan.toString(),
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 15),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(left: 15, top: 10),
        //             child: Row(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(top: 10),
        //                   child: Text(
        //                     "Total Kepala Keluarga tahun " +
        //                         widget.tahun.toString() +
        //                         " : ",
        //                     style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                         fontSize: 14),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(top: 20),
        //             child: Text(
        //               widget.total.toString(),
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 30,
        //                   color: Colors.green),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
