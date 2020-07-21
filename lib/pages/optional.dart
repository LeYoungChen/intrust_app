import 'package:flutter/material.dart';

class optional extends StatefulWidget {
  @override
  _optionalState createState() => _optionalState();
}

class _optionalState extends State<optional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.withOpacity(1),
        elevation: 0,
        title: Text('自選股'),
      ),
    );
  }
}
