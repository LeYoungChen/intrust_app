import 'package:flutter/material.dart';

import 'package:pageview_indicator_plugins/pageview_indicator_plugins.dart';


class backtest extends StatefulWidget {
  @override
  _backtestState createState() => _backtestState();

}


class Indicator extends StatelessWidget {
  Indicator({
    this.controller,
    this.itemCount: 0,
  }) : assert(controller != null);

  final PageController controller;

  final int itemCount;

  final Color normalColor = Colors.black;

  final Color selectedColor = Color.fromRGBO(237,239,241,1);

  final double size = 8.0;

  final double spacing = 4.0;

  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // 是否被當前頁面選中
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page.round() % pageCount : 0);

    return new Container(
      height: size,
      width: size + (2 * spacing),
      child: new Center(
        child: new Material(
          color: isCurrentPageSelected ? selectedColor : normalColor,
          type: MaterialType.circle,
          child: new Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}

class _backtestState extends State<backtest> {
  String _backTestValue = "3";

  final PageController controller = PageController(initialPage: 200);

  void _pageChanged(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(237,239,241,1),
        elevation: 3,
        title: Text('投資策略回測'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            child: Center(
              child: new DropdownButton(
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    child: Text(
                      "    投資策略#1",
                      style: TextStyle(
                          color:
                              _backTestValue == "1" ? Colors.red : Colors.grey),
                    ),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "    投資策略#2",
                      style: TextStyle(
                          color:
                              _backTestValue == "2" ? Colors.red : Colors.grey),
                    ),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "    投資策略#3",
                      style: TextStyle(
                          color:
                              _backTestValue == "3" ? Colors.red : Colors.grey),
                    ),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "    投資策略#4",
                      style: TextStyle(
                          color: _backTestValue == "4" ? Colors.red : Colors.grey),
                    ),
                    value: "4",
                  ),
                ],
                hint: new Text("    投資策略選擇",style: TextStyle(color: Colors.redAccent),),
                onChanged: (selectValue) {
                  setState(() {
                    _backTestValue = selectValue;
                  });
                },
                value: _backTestValue,
                elevation: 24,
                style: new TextStyle(color: Colors.redAccent, fontSize: 16),
                iconSize: 30,
                underline: Container(),
                isExpanded: true,
              ),
            ),
          ),
          new SizedBox(
//            height: 580.0,
//            child: PageView(
//              children: <Widget>[
//                Container(child: Text("  投資策略回測資訊",
//                  style: TextStyle(color: Colors.black,fontSize: 40),),),
//                Container(child: Text("  交易線圖及交易詳情",
//                  style: TextStyle(color: Colors.black,fontSize: 40)),),
//              ]
//            ),
              height: 645.0,
              child: Container(
                color: Colors.grey,
                child: PageView.builder(
                  onPageChanged: _pageChanged,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return new Center(
                      child: new Container(
                        color: Color.fromRGBO(250, 250, 250, 1),
                      ),
                    );
                  },
                ),
              )),
          Indicator(
            controller: controller,
            itemCount: 2,
          ),
        ],
      ),
    );
  }



}
