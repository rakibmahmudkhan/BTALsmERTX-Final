
import 'package:btal_smer_tx/model/button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class WelcomeScreenQrCode extends StatefulWidget {
  const WelcomeScreenQrCode({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenQrCode> createState() => _WelcomeScreenQrCodeState();
}

class _WelcomeScreenQrCodeState extends State<WelcomeScreenQrCode> {
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
    return Column(
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
    );
  }
}
