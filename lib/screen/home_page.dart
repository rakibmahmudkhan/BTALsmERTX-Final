import 'package:btal_smer_tx/screen/scan_qr_page.dart';
import 'package:flutter/material.dart';
import 'package:btal_smer_tx/screen/about_us_page.dart';
import 'package:btal_smer_tx/screen/dash_board_page.dart';
import 'package:btal_smer_tx/screen/drawer_header_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.dashboard) {
      container = DashBoardPage();
    } else if (currentPage == DrawerSections.ScanQrPage) {
      container = ScanQrPage();
    }else if (currentPage == DrawerSections.AboutUs) {
      container = AboutUsPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'BTALsmERTX',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.8,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHeaderPage(),
                DrawerList()
              ],
            ),
          ),
        ),
      ),

    );
  }
  Widget DrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Scan Qr Page", Icons.qr_code,
              currentPage == DrawerSections.ScanQrPage ? true : false),
          menuItem(3, "About us", Icons.people_alt_outlined,
              currentPage == DrawerSections.AboutUs ? true : false),

        ],
      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.ScanQrPage;
            }else if (id == 3) {
              currentPage = DrawerSections.AboutUs;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
enum DrawerSections {
  dashboard,
  ScanQrPage,
  AboutUs,

}