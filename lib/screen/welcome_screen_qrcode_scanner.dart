import 'package:btal_smer_tx/model/button.dart';
 import 'package:btal_smer_tx/screen/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool cameraRotate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.green,
                  borderRadius: 10,
                  borderLength: 20,
                  borderWidth: 8,
                  cutOutSize: 300,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller?.flipCamera();
                        setState(() {
                          cameraRotate = !cameraRotate;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: FutureBuilder(
                        future: controller?.getCameraInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return Icon(
                              /*snapshot.data != -1*/
                              cameraRotate == false
                                  ? Icons.cameraswitch_rounded
                                  : Icons.cameraswitch_outlined,
                              size: 25,
                              color: Colors.blueGrey,
                            ); /* return Text(
                             */ /* Camera facing   */ /*'${describeEnum(snapshot.data!)}');*/
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
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Icon(
                            snapshot.data == false
                                ? Icons.flash_auto
                                : Icons.flash_off,
                            size: 25,
                            color: Colors.blueGrey,
                          );
                          /* return Text('Flash: ${snapshot.data}');*/
                        },
                      )),
                ),
              ],
            ),
            Expanded(
              flex: 1,
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
                    () async {
                      controller!.resumeCamera();
                      if (result!.code != null ) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('displayName', result!.code.toString());
                        print(' ${result!.code}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                  ),
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
