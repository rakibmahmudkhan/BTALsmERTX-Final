import 'dart:convert';
import 'dart:io';

import 'package:btal_smer_tx/model/ModelName.dart';
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

  bool cameraRotate = false;
  late List<ModelName> dataList = [];

  Future<List<ModelName>> getDataList() async {
    String mdata = ' $result!.code.toString()';
    var data= jsonDecode(mdata.toString());

    if (data != null) {
      for (Map i in data) {
        ModelName modelName = ModelName(terminalName: i['terminalName'], terminalUuid: i['terminalUuid'], );
        dataList.add(modelName);
      }
      return dataList;
    }
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    readQr();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),*/
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
              cutOutSize: 160,
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
                    backgroundColor: MaterialStateProperty.all(Colors.white),
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
                    backgroundColor: MaterialStateProperty.all(Colors.white),
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
                      /*return Text('Flash: ${snapshot.data}');*/
                    },
                  )),
            ),
          ],
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Center(
                child: (result != null)
                    ? Text(
                        'Barcode Type: ${describeEnum(result!.format)}\nData: ${result!.code}')
                    : const Text('Scan a code'),
              ),
                FutureBuilder(future:getDataList(),builder: (context, AsyncSnapshot<List<ModelName>> snapshot){
                  if(!snapshot.hasData){
                    return Text("Loading");
                  }else{
                    return ListView.builder(itemCount:dataList.length, itemBuilder: (context,index){
                      return ListTile(
                        title: Text(snapshot.data![index].terminalName.toString()),
                        subtitle: Text(snapshot.data![index].terminalUuid.toString()),

                      );
                    });
                  }
                })
            ],
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

class ModelName {
  String? terminalName;
  String? terminalUuid;


  ModelName({this.terminalName, this.terminalUuid,  });
}
