import 'package:flutter/material.dart';

class backtest extends StatefulWidget {
  @override
  _backtestState createState() => _backtestState();
}

class _backtestState extends State<backtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(1),
        elevation: 0,
        title: Text('用戶頁面'),
      ),
    );
  }
}