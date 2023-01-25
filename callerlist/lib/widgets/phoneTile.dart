import 'package:callerlist/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions/coreFunction.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard({
    Key? key,
    required this.size,
    required this.name,
    required this.number,
  }) : super(key: key);

  final Size size;
  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      decoration: const BoxDecoration(color: cardColor, boxShadow: [
        BoxShadow(
            color: Color.fromARGB(156, 229, 228, 228),
            blurRadius: 6,
            spreadRadius: 1.0,
            offset: Offset(0, 0))
      ]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: GoogleFonts.arefRuqaa(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14))),
                Text(number),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      makePhoneCall(number);
                    },
                    child: const Image(
                      image: AssetImage('assets/images/call.png'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap: () {
                      copycontent(number);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Copied Successfully!")));
                    },
                    child: const Image(
                      image: AssetImage('assets/images/copy.png'),
                      width: 30,
                      height: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
