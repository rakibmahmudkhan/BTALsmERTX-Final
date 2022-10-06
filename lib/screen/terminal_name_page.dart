import 'package:flutter/material.dart';
class TerminalNamePage extends StatefulWidget {
  const TerminalNamePage({Key? key}) : super(key: key);

  @override
  State<TerminalNamePage> createState() => _TerminalNamePageState();
}

class _TerminalNamePageState extends State<TerminalNamePage> {
  @override
  Widget build(BuildContext context) {
    return     Container(
      child: Center(
        child: Text("Terminal Name Page"),
      ),
    );
  }
}
