import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SejarahPage extends StatefulWidget {
  const SejarahPage({Key? key}) : super(key: key);

  @override
  _SejarahPageState createState() => _SejarahPageState();
}

class _SejarahPageState extends State<SejarahPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore dbSejarah = FirebaseFirestore.instance;
    CollectionReference sejarah = dbSejarah.collection('latarBelakang');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text(
          "Sejarah",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/candi.jpg"),
                          fit: BoxFit.fill)),
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: sejarah.doc('sejarah').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            snapshot.data!['desk'].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        );
                      else {
                        return Text("Mohon Tunggu");
                      }
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
