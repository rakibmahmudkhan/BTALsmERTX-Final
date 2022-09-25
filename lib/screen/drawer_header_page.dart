import 'package:flutter/material.dart';
class DrawerHeaderPage extends StatefulWidget {
  const DrawerHeaderPage({Key? key}) : super(key: key);

  @override
  State<DrawerHeaderPage> createState() => _DrawerHeaderPageState();
}

class _DrawerHeaderPageState extends State<DrawerHeaderPage> {
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
            'Mr. Rahim',
            style: TextStyle(  fontSize: 20),
          ),
        ],
      )
      ,
    );
  }
}
