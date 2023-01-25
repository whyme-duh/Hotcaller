import 'package:callerlist/constants/constant.dart';
import 'package:callerlist/screens/pageTemplate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    CollectionReference _ambulanceServices =
        FirebaseFirestore.instance.collection('Ambulance Services');
    CollectionReference _numberList =
        FirebaseFirestore.instance.collection('Caller List');
    CollectionReference _electricalList =
        FirebaseFirestore.instance.collection('Electrical Services');
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), bottomRight: Radius.circular(40))),
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_outlined),
                color: Colors.red,
                iconSize: 30,
              ),
              const DrawerHeader(
                  child: Image(
                image: AssetImage('assets/images/hot.png'),
              )),
            ],
          ),
          DrawerCard(
            title: "Emergency Numbers",
            routeName: PageTemplate(
              collectionReference: _numberList,
              size: size,
              appBarTitle: "Emergency Service Numbers",
            ),
            icon: const Image(
              image: AssetImage('assets/icons/alarm.png'),
              width: 30,
              height: 30,
            ),
          ),
          DrawerCard(
            title: "Ambulance Numbers",
            routeName: PageTemplate(
              collectionReference: _ambulanceServices,
              size: size,
              appBarTitle: "Ambulance Service Numbers",
            ),
            icon: const Image(
              image: AssetImage('assets/icons/ambulance.png'),
              width: 30,
              height: 30,
            ),
          ),
          DrawerCard(
            title: "Electricity Numbers",
            routeName: PageTemplate(
              collectionReference: _electricalList,
              size: size,
              appBarTitle: "Electricity Service Numbers",
            ),
            icon: const Image(
              image: AssetImage('assets/icons/plug.png'),
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerCard extends StatelessWidget {
  final String title;
  final Widget routeName;
  final Image icon;
  const DrawerCard({
    Key? key,
    required this.title,
    required this.routeName,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 182, 186, 244),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => routeName));
            },
            icon: icon,
            label: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: GoogleFonts.baloo2(
                    textStyle:
                        const TextStyle(fontSize: 17, color: Colors.black)),
              ),
            )),
      ),
    ));
  }
}
