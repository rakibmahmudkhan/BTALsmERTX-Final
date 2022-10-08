import 'package:flutter/material.dart';

class UserQrScanPage extends StatefulWidget {
  const UserQrScanPage({Key? key}) : super(key: key);

  @override
  State<UserQrScanPage> createState() => _UserQrScanPageState();
}

class _UserQrScanPageState extends State<UserQrScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0), // here the desired height
          child: AppBar(
            title: Text(
              "User",
              style: TextStyle(color: Colors.black87),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {

                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context){return UserQrScanPage();}));
                      },
                      child: Expanded(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  size: 70,
                                  color: Colors.green,
                                ),
                                Text(
                                  'RFID',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Expanded(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.nfc_sharp,
                                  size: 70,
                                  color: Colors.green,
                                ),
                                Text(
                                  'NFC',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserQrScanPage()));},
                      child: Expanded(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.qr_code_outlined,
                                  size: 60,
                                  color: Colors.green,
                                ),
                                Text(
                                  'QR Scan',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Expanded(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 60,
                                  color: Colors.green,
                                ),
                                Text(
                                  'NULL',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*Container(
                    child: Spacer(),
                  )*/
                ],
              ),
            ],
          ),
        ));
  }
}
