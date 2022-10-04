import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../model/button.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
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

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
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
    readQr();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.green,
                  borderRadius: 10,
                  borderLength: 20,
                  borderWidth: 8,
                  cutOutSize: 200,
                ),
              ),
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: () async {
                      await controller?.flipCamera();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Text(
                              'Camera facing ${describeEnum(snapshot.data!)}');
                        } else {
                          return const Text('loading');
                        }
                      },
                    )),
              ),
                Container(
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Text('Flash: ${snapshot.data}');
                        },
                      )),
                ),],
            ),

            Expanded(
              flex: 5,
              child: Center(
                child: (result != null)
                    ? Text(
                        'Barcode Type: ${describeEnum(result!.format)}\nData: ${result!.code}')
                    : const Text('Scan a code'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton.customButton(
                  context,
                  'Scan',
                  CustomButton.onPressedByCondition(
                    false,
                    () {
                      controller!.resumeCamera();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
