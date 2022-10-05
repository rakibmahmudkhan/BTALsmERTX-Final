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
    return Container(child: Center(child: ScanQrCodeScreen()));
  }
}
