import 'package:callerlist/constants/constant.dart';

import 'package:callerlist/screens/pageTemplate.dart';
import 'package:callerlist/screens/searchPage.dart';
import 'package:callerlist/widgets/phoneTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchfield/searchfield.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/categoryList.dart';
import '../widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final CollectionReference _emergencyList =
      FirebaseFirestore.instance.collection('Caller List');

  final CollectionReference _ambulanceServices =
      FirebaseFirestore.instance.collection('Ambulance Services');

  final CollectionReference _elecricalServices =
      FirebaseFirestore.instance.collection('Electrical Services');
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => SearchPage())));
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: SvgPicture.asset(
                'assets/images/menu.svg',
                width: 10,
                height: 10,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: CategoryList(
                size: size,
                numberList: _emergencyList,
                title: "Emergency Service Numbers",
                route: PageTemplate(
                  collectionReference: _emergencyList,
                  size: size,
                  appBarTitle: "Emergency Service Numbers",
                ),
              ),
            ),
            // ListTile(
            //   title: CategoryList(
            //     size: size,
            //     numberList: _ambulanceServices,
            //     title: "Ambulance Service Numbers",
            //     route: const AmbulanceServices(),
            //   ),
            // ),
            ListTile(
              title: CategoryList(
                size: size,
                numberList: _elecricalServices,
                title: "Electrical Service Numbers",
                route: PageTemplate(
                  collectionReference: _elecricalServices,
                  size: size,
                  appBarTitle: "Electrical Service Numbers",
                ),
              ),
            ),
          ],
        ));
  }
}
