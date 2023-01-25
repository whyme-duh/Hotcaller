import 'package:callerlist/widgets/phoneTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required this.size,
    required CollectionReference<Object?> numberList,
    required this.title,
    required this.route,
  })  : _numberList = numberList,
        super(key: key);

  final Size size;
  final String title;
  final Widget route;
  final CollectionReference<Object?> _numberList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.baloo2(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => route));
                  },
                  child: const Text("See All"))
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.4,
          child: StreamBuilder(
            stream: _numberList.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text(" Hold on Tight!");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("LOADING...");
              }
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: PhoneCard(
                        name: snapshot.data!.docs[index]['Name'],
                        number: snapshot.data!.docs[index]['Number'],
                        size: size,
                      ),
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
