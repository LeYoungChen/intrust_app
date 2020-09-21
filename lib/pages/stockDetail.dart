import 'package:flutter/material.dart';
import 'package:intrust/Stock.dart';
import 'package:intrust/pages/home.dart';
import 'package:intrust/pages/home.dart';
import 'package:intrust/pages/recommend.dart';
import 'package:intrust/stock.dart';
import 'package:flutter/cupertino.dart';



class stockDetail extends StatefulWidget {
  @override
  _stockDetailState createState() => _stockDetailState();

}

class _stockDetailState extends State<stockDetail> with SingleTickerProviderStateMixin{

  TabController _tabController;
  List tabs = [
    '財務',
    '籌碼',
    '技術',
    '資訊',
    '新聞',
  ];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => recommend()));
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){},
              child: Icon(Icons.add),
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Color.fromRGBO(237,239,241,1),
        elevation: 3,
        title: Text("公司名稱（代碼）",),
        bottom: TabBar(
            indicatorColor: CupertinoColors.systemRed,
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
    );
  }
}
