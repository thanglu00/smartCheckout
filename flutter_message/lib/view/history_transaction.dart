import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History_View extends StatefulWidget {
  History_View(String gmail);

  @override
  _MyHistoryView createState() => _MyHistoryView();
}

class _MyHistoryView extends State<History_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "    Tìm kiếm giao dịch",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search))),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text("tất cả"),
                  onPressed: () => null,
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("thành công", style: TextStyle(fontSize: 13)),
                  onPressed: () => null,
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("thất bại"),
                  onPressed: () => null,
                ),
              ),
            ],
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            ///
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Thanh toán thành công'),
              ),
              ListTile(
                leading: Icon(Icons.money_off),
                title: Text('thanh toán thất bại'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
