import 'package:flutter/material.dart';
//import 'package:qrscan/qrscan.dart' as scanner;

class MyAppQr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRCode Demo',
      home: HomePageqr(),
    );
  }
}

class HomePageqr extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageqr> {
  String scanResult = '';

  //function that launches the scanner
  Future scanQRCode() async {
//    String cameraScanResult = await scanner.scan();
    setState(() {
//      scanResult = cameraScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('QR Scan Demo'),
//      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            scanResult == '' ? Text('Result will be displayed here') : Text(scanResult),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.blue,
              child: Text('Click To Scan', style: TextStyle(color: Colors.white),),
              onPressed: scanQRCode,
            )
          ],
        ),
      ),
    );
  }
}


//import 'dart:async';
//
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//
//class ScanScreen extends StatefulWidget {
//  @override
//  _ScanState createState() => new _ScanState();
//}
//
//class _ScanState extends State<ScanScreen> {
//  String barcode = "";
//
//  @override
//  initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: new AppBar(
//          title: new Text('QR Code Scanner'),
//        ),
//        body: new Center(
//          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                child: RaisedButton(
//                    color: Colors.blue,
//                    textColor: Colors.white,
//                    splashColor: Colors.blueGrey,
//                    onPressed: scan,
//                    child: const Text('START CAMERA SCAN')
//                ),
//              )
//              ,
//              Padding(
//                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                child: Text(barcode, textAlign: TextAlign.center,),
//              )
//              ,
//            ],
//          ),
//        ));
//  }
//
//  Future scan() async {
//    try {
//      String barcode = (await BarcodeScanner.scan()) as String;
//      setState(() => this.barcode = barcode);
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.cameraAccessDenied) {
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
//      } else {
//        setState(() => this.barcode = 'Unknown error: $e');
//      }
//    } on FormatException{
//      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
//    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
//    }
//  }
//}