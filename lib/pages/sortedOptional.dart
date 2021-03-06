import 'package:flutter/material.dart';
import 'package:intrust/Stock.dart';
import 'package:intrust/pages/stockDetail.dart';

class sortedOptional extends StatefulWidget {
  @override
  _sortedOptionalState createState() => _sortedOptionalState();
}

class _sortedOptionalState extends State<sortedOptional> {

  final List<Stock> stockList = [
    Stock("Stock1", 320.60, 32.12, 3.11, 'indicator'),
    Stock("Stock2", 127.38, 2.32, 3.11, 'indicator'),
    Stock("Stock3", 54.22, 29.66, 3.11, 'indicator'),
    Stock("Stock4", 89.21, -1.54, 3.11, 'indicator'),
    Stock("Stock5", 150.34, -6.77, 3.11, 'indicator'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(1),
        elevation: 0,
        title: Text('自選股'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sortedOptional()));
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

    class AddStockWidget extends StatefulWidget {
    @override
    _AddStockWidgetState createState() => _AddStockWidgetState();
    }

    class _AddStockWidgetState extends State<AddStockWidget> {
    @override
    Widget build(BuildContext context) {
    return Container();
  }
}


