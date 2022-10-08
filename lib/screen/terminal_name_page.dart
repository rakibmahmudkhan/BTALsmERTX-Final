import 'dart:convert';

import 'package:btal_smer_tx/model/ModelName.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TerminalNamePage extends StatefulWidget {
  const TerminalNamePage({Key? key}) : super(key: key);

  @override
  State<TerminalNamePage> createState() => _TerminalNamePageState();
}

class _TerminalNamePageState extends State<TerminalNamePage> {
  String displayName = "";
  late int uUid;
  List<String> nameList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    displayName = prefs.getString('displayName')!;

    setState(() {});
  }


/*  dataValue() {
    String data = display();

    var encodedString = jsonEncode(data);

    Map<String, dynamic> valueMap = json.decode(encodedString);

    ModelName modelName = ModelName().fromJson<ModelName>(valueMap);
  }*/

/*  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //nameList.add(displayName);
      */ /*displayName = prefs.getString('displayName')!;
      String jsonStr = prefs.getString('displayName')!;
      Map<String,dynamic> d  = json.decode(jsonStr.trim());
      List<ModelName> mList = List<ModelName>.from(d['terminal_name'].map((x) => ModelName.fromJson(x)));
      mName =mList ;*/ /*
  // mName = mList[index].terminalUuid.toString() as List<ModelName>?;
    });
  }*/

  display() {
    if (displayName != null) {
      return Column(
        children: [
          Text(" $displayName  "),
        ],
      );
    } else {
      return Text("Welcome  ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(child: display()),
            ),
            /*Text('${mName[index].terminalName}' )*/

            /* Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                  child: ListView.builder(
                      itemCount: nameList.length, itemBuilder: (context, index){
                        return Text(nameList[index]);
                  })),
            ),*/
          ],
        )),
      ),
    );
  }
}
