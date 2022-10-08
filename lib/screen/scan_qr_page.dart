import 'package:btal_smer_tx/screen/scan_qr_code_screen.dart';
import 'package:flutter/material.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // here the desired height
    child: AppBar(backgroundColor: Colors.white,iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),),),
        body:
     Container(child: Center(child: ScanQrCodeScreen())));
  }
}
