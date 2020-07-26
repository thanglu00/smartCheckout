import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttermessage/view/qrCode/scan.dart';

import 'package:fluttermessage/view/qrCode/generate_qr_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MyQrPage extends StatefulWidget {
  String phoneNumber;
  MyQrPage({Key key,this.phoneNumber}) : super(key : key);

//  MyQrPage(this.title);
//  final String title;

  @override
  _MyQrPageState createState() => _MyQrPageState();
}

class _MyQrPageState extends State<MyQrPage> {
  var indexChoose=0;
  toggleSwitch(int value){
    if(value == 0){
      return GenerateScreen(widget.phoneNumber);
    }else return MyAppQr();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            ToggleSwitch(
              minWidth: 90.0,
              activeBgColor: Colors.redAccent,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.grey[900],
              labels: ['QR code', 'Scan'],
              onToggle: (index) {
                print('switched to: $index');
                setState(() {
                  indexChoose = index;
                  toggleSwitch(index);
                });
              },
            ),

            Expanded(
              child: toggleSwitch(indexChoose),
            ),
          ],
        ),
      ),
    );
  }
}