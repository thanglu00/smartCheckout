import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RechargeMoney extends StatefulWidget {
  @override
  _rechargeMoney createState() => _rechargeMoney();
}
class _rechargeMoney extends State<RechargeMoney>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 14),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nhập số Tiền")),
//              Row(
//                children: <Widget>[
//                  new Flexible(child: new TextField(
//                    decoration: const InputDecoration(helperText: "Enter Money Number"),
//                    style: Theme.of(context).textTheme.body1,
//                  )),
//                ],
//              ),
              SizedBox(height: 30,),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                ),
                child: ListTile(
                  leading: Icon(Icons.monetization_on, color: Colors.purple,),
                  title: Text("Nạp tiền qua momo", style: TextStyle(fontSize: 20),),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                ),
                child: ListTile(
                  leading: Icon(Icons.attach_money, color: Colors.blue,),
                  title: Text("Nạp tiền qua Ngân hàng", style: TextStyle(fontSize: 20),),
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                child: const Text('Nap tien', style: TextStyle(fontSize: 20),),
                onPressed: (){},

              ),

            ],
          ),
        ),
      ),

    );
  }

}