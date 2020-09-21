import 'package:flutter/material.dart';

class machine extends StatefulWidget {
  @override
  _machineState createState() => _machineState();
}

class _machineState extends State<machine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(237,239,241,1),
        elevation: 3,
        title: Text('我的投資策略'),
      ),
    );
  }
}
