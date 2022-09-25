 import 'package:flutter/material.dart';
import 'package:btal_smer_tx/screen/scan_qr_code_screen.dart';

 class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {





  @override
  Widget build(BuildContext context) {
    return ScanQrCodeScreen();

  }
}




