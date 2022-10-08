import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DrawerHeaderPage extends StatefulWidget {
  const DrawerHeaderPage({Key? key}) : super(key: key);

  @override
  State<DrawerHeaderPage> createState() => _DrawerHeaderPageState();
}

class _DrawerHeaderPageState extends State<DrawerHeaderPage> {
  String displayName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getString('displayName')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ),
          Text(
           displayName,
            style: TextStyle(  fontSize: 20),
          ),
        ],
      )
      ,
    );
  }
}
