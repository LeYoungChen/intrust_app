import 'package:flutter/material.dart';

class recommend extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<recommend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.withOpacity(1),
        elevation: 0,
        title: Text('我的推薦清單'),

      ),
    );
  }
}
