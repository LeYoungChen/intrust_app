import 'package:flutter/material.dart';
import 'package:intrust/Stock.dart';
import 'package:intrust/pages/recommend.dart';
import 'package:intrust/pages/sortedOptional.dart';
import 'package:intrust/pages/stockDetail.dart';
import 'package:intrust/pages/home.dart';

class optional extends StatefulWidget {
  @override
  _optionalState createState() => _optionalState();
}

class _optionalState extends State<optional> {
  final List<Stock> stockList = [
    Stock("Stock1", 320.60, 32.12, 3.11, 'indicator'),
    Stock("Stock2", 127.38, 2.32, 3.11, 'indicator'),
    Stock("Stock3", 54.22, 29.66, 3.11, 'indicator'),
    Stock("Stock4", 89.21, -1.54, 3.11, 'indicator'),
    Stock("Stock5", 150.34, -6.77, 3.11, 'indicator'),
  ];


  // TODO: @Jane Chen @Liyang Chen
  // TODO: 添加個股功能

  void _addStock() {
    setState(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(237,239,241,1),
          elevation: 3,
          title: Text('自選股'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(237,239,241,1),
        elevation: 3,
        title: Text('自選股'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                _addStock();
                print('Tapped');
              },
              child: Icon(Icons.menu),
            ),
          )
        ],
      ),
      body: Container(
          child: new ListView.builder(
              itemCount: stockList.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildStockCard(context, index))),
    );
  }

  Offset _offset = Offset.zero;

  // TODO: drag and drop功能實現

  Widget dragDrop(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: _offset.dx,
            top: _offset.dy,
            child: LongPressDraggable(
              feedback: buildStockCard(context, index),
              child: buildStockCard(context, index),
              onDragEnd: (details) {
                setState(() {
                  final adjustment = MediaQuery.of(context).size.height ;
                  _offset = Offset(details.offset.dx, details.offset.dy - adjustment);
                });
              },
            ))
      ],
    );
  }


  // TODO: @Jane Chen
  // TODO: 個股列表從Card替換為Table


  Widget buildStockCard(BuildContext context, int index) {
    final stock = stockList[index];
    return Container(
      child: Card(
        child: new InkWell(
          onTap: () {
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
                    children: <Widget>[
                      Text(stock.title,
                          style: new TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.start)
                    ],
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
