import 'package:btal_smer_tx/screen/welcome_screen_qrcode_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../model/button.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    this.controller!.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);
    });
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      // Can read multiple time.
      // If uncomment this line, camera stop after read qr code
      // controller!.dispose();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        body:WelcomeScreenQrCode(),
      ),
    );
  }
}
