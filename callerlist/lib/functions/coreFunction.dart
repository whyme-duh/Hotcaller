import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

makePhoneCall(String number) async {
  Uri url = Uri.parse('tel:{$number}');
  if (await launchUrl(url)) {
  } else {
    throw "Could not ";
  }
}

void copycontent(String text) {
  FlutterClipboard.copy(text).then((value) => const ScaffoldMessenger(
      child: SnackBar(content: Text("Copied Sucessfull"))));
}
