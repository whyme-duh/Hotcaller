import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constant.dart';
import '../widgets/phoneTile.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({
    Key? key,
    required CollectionReference<Object?> collectionReference,
    required this.size,
    required this.appBarTitle,
  })  : _collectionReference = collectionReference,
        super(key: key);

  final CollectionReference<Object?> _collectionReference;
  final String appBarTitle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: 60,
          title: Text(
            appBarTitle,
            style:
                GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          floating: true,
          backgroundColor: appBarBg,
          elevation: 0,
        )
      ],
      body: StreamBuilder(
          stream: _collectionReference.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("s");
            }
            if (!snapshot.hasData) {
              return Text("No Data");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return ListTile(
                  title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PhoneCard(
                  size: size,
                  name: document['Name'],
                  number: document['Number'],
                ),
              ));
            }).toList());
          }),
    ));
  }
}
