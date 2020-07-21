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
        backgroundColor: Colors.redAccent.withOpacity(1),
        elevation: 0,
        title: Text('我的投資策略'),
      ),
    );
  }
}
