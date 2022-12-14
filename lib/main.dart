import 'package:btal_smer_tx/screen/splash_page.dart';
import 'package:btal_smer_tx/screen/welcome_page.dart';
import 'package:btal_smer_tx/screen/welcome_screen_qrcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:btal_smer_tx/screen/home_page.dart';

import 'package:btal_smer_tx/screen/scan_qr_code_screen.dart';

void main() {
  runApp(const MyAwesomeApp());
}

class MyAwesomeApp extends StatefulWidget {
  const MyAwesomeApp({Key? key}) : super(key: key);

  @override
  State<MyAwesomeApp> createState() => _MyAwesomeAppState();
}

class _MyAwesomeAppState extends State<MyAwesomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SplashScreen(),);
  }
}


