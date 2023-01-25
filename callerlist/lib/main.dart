import 'package:callerlist/constants/constant.dart';
import 'package:callerlist/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CallerList());
}

class CallerList extends StatefulWidget {
  const CallerList({super.key});

  @override
  State<CallerList> createState() => _CallerListState();
}

class _CallerListState extends State<CallerList> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',

        home: Home());
  }
}
