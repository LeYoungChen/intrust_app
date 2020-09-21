import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intrust/Stock.dart';
import 'package:intrust/pages/stockDetail.dart';

class recommend extends StatefulWidget {
  @override
  _recommendState createState() => _recommendState();
}

/// 此List標註了stocks的訊息
/// properties的定義參見Stock.dart
class _recommendState extends State<recommend> with SingleTickerProviderStateMixin{
  final List<Stock> stockList = [
    Stock("Stock1", 320.60, 32.12, 3.11, 'indicator'),
    Stock("Stock2", 127.38, 2.32, 3.11, 'indicator'),
    Stock("Stock3", 54.22, 29.66, 3.11, 'indicator'),
    Stock("Stock4", 89.21, -1.54, 3.11, 'indicator'),
    Stock("Stock5", 150.34, -6.77, 3.11, 'indicator'),
  ];

  /// 定義一個tab controller
  /// 用於顯示在App Bar下方顯示各大股市選項
  TabController _tabController;
  List tabs = [
    '台加權指',
    '納斯達克',
    '日經指數',
    '恆生指數',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237,239,241,1),// App Bar的背景色是為灰色
        elevation: 3,
        centerTitle: true,
        /// Leading設定title前的icon
        leading: GestureDetector(
          onTap: (){},
          child: Icon(Icons.menu),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){},
              child: Icon(Icons.search),
            ),
          )
        ],
        title: Image(
          image: AssetImage('assets/images/logo_horizontal.png'),
          height: 24,),
        bottom: TabBar(
          /// 此處用到各大股市的tabs
            indicatorColor: CupertinoColors.systemRed,
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: Container(
          child: new ListView.builder(
              itemCount: stockList.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildStockCard(context, index))),
    );
  }


  // TODO: @Jane Chen
  // TODO: 個股列表從Card替換為Table



  /// buildStockCard用來構建個股資訊卡片
  /// Card為核心的widget
  /// 用Inkwell包裝以使卡片可以被點擊
  Widget buildStockCard(BuildContext context, int index) {
    final stock = stockList[index];
    return Container(
      child: Card(
        child: new InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => stockDetail()));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(
                    children: <Widget>[Text(stock.title,
                        style: new TextStyle(fontSize: 30.0),
                        textAlign: TextAlign.start)],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Price: '),
                      Text(stock.price.toString()),
                      Spacer(),
                      Text('Price Diff: '),
                      Text(stock.priceDiff.toString())
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('PCT Diff: '),
                    Text(stock.pctDiff.toString()),
                    Spacer(),
                    Text('Indicator: '),
                    Text(stock.indicator),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

