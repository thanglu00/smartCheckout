import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
class GenerateScreen extends StatefulWidget {
  String phoneNumber;
  GenerateScreen(this.phoneNumber);

  @override
  State<StatefulWidget> createState() => GenerateScreenState();
}

class GenerateScreenState extends State<GenerateScreen> {
  bool result;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String title = "Title";
    String helper = "helper";
  }
  
  
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  GlobalKey globalKey = new GlobalKey();
  String _dataString = "Nguyen Cong Thang";
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentWidget(),
    );
  }
  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(
//              top: _topSectionTopPadding,
//              left: 20.0,
//              right: 10.0,
//              bottom: _topSectionBottomPadding,
//            ),
//            child: Container(
//              height: _topSectionHeight,
//              child: Row(
//                mainAxisSize: MainAxisSize.max,
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  Expanded(
//                    child: TextField(
//                      controller: _textController,
//                      decoration: InputDecoration(
//                        hintText: "Enter a custom message",
//                        errorText: _inputErrorText,
//                      ),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(left: 10.0),
//                    child: FlatButton(
//                      child: Text("SUBMIT"),
//                      onPressed: () {
//                        setState(() {
//                          _dataString = _textController.text;
//                          _inputErrorText = null;
//                        });
//                      },
//                    ),
//                  )
//                ],
//              ),
//            ),
//          ),
          Expanded(
            child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data: widget.phoneNumber,
                  size: 0.5 * bodyHeight,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
