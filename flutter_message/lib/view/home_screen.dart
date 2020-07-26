import 'dart:convert';
import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermessage/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:fluttermessage/bloc/orderHistory/history_transaction.dart';
import 'package:fluttermessage/object_transfer/inforUser.dart';
import 'package:fluttermessage/object_transfer/userInfo.dart';
import 'package:fluttermessage/view/message_view.dart';
import 'package:fluttermessage/view/phoneNumberScreen.dart';
import 'package:fluttermessage/view/qrCode/qrCodeHome.dart';
import 'package:fluttermessage/view/recharge_money.dart';
import 'package:fluttermessage/view/userPage.dart';

class HomeScreen extends StatefulWidget {
  final User_Info name;

  HomeScreen(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String tmp = "";

class _MyHomePageState extends State<HomeScreen> {
  int currentTabIndex = 0;
  String titleAppbar;

  final Firestore _db = Firestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//  final FirebaseMessaging _fcm = FirebaseMessaging();
//  _saveDeviceToken() async {
//    // Get the current user
//    String uid = 'jeffd23';
//    // FirebaseUser user = await _auth.currentUser();
//
//    // Get the token for this device
//    String fcmToken = await _fcm.getToken();
//
//    // Save it to Firestore
//    if (fcmToken != null) {
//      var tokens = _db
//          .collection('users')
//          .document(uid)
//          .collection('tokens')
//          .document(fcmToken);
//
//      await tokens.setData({
//        'token': fcmToken,
//        'createdAt': FieldValue.serverTimestamp(), // optional
//        'platform': Platform.operatingSystem // optional
//      });
//    }
//  }

  String phoneNumber ="";
  String balance="";
  String title = "Title";
  String helper = "helper";

  UserRepo rept;
  InformUser balanceInf;

  @override
  void initState() {
    super.initState();
    _db.collection("users").document(widget.name.gmail).get().then((value){
      setState(() {
        phoneNumber = value.data["phone"];
        currentTabIndex = 0;
        print(phoneNumber);
      });
    });

    _db
        .collection("users")
        .document(widget.name.gmail)
        .snapshots()
        .listen((event) {
      print(event.data["phone"]);
      setState(() {
        phoneNumber = event.data["phone"];
      });
    });


//    _saveDeviceToken();
    titleAppbar = widget.name.name;
//    getUserData();
//    print(balanceInf.balance);

    _firebaseMessaging.configure(
      onMessage: (message) async {
        setState(() {
          title = message["notification"]["title"];
          helper = "You have recieved a new notification";
        });
      },
      onResume: (message) async {
        setState(() {
          title = message["data"]["title"];
          helper = "You have open the application from notification";
        });
      },
    );
  }

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  Widget getPage(int index) {
    if (index == 0) {
      return new UserPage(name: UserPhoneBalance(widget.name.name,phoneNumber));
    }
    if (index == 1) {
      return new RechargeMoney();
    }
    if (index == 2) {
      return new MyQrPage(
        phoneNumber: phoneNumber,
      );
    }
    if (index == 3) {
      return new History_View(gmailUser: widget.name.gmail);
    }
    return new UserPage();
  }

  List<Widget> tabs = [
    UserPage(),
    RechargeMoney(),
    MyQrPage(),
    History_View(),
  ];

//  checkExistPhoneNumber() async{
//    String user = (await FirebaseAuth.instance.currentUser()).email;
//    _db.collection("users").document(user).collection(collectionPath).then((_){print("success add phone!");});
//  }
  void moveToPhoneUpdate() async {
    final infor = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PhoneNumberScreen(widget.name)));
    setState(() {
      phoneNumber = infor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Smart Checkout"),
        actions: <Widget>[
          if (phoneNumber == "null")
            IconButton(
                icon: Icon(Icons.add_alert),
                onPressed: () {
                  moveToPhoneUpdate();
                }),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                AuthenticationLoggedOut(),
              );
            },
          ),
        ],
      ),
      body: getPage(currentTabIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money), title: Text("Nap Tien")),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallpaper), title: Text("Thanh Toan")),
            BottomNavigationBarItem(
                icon: Icon(Icons.subject), title: Text("Lich su"))
          ]),
    );
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Center(child: Text('Welcome $name!')),
//          Padding(
//            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//            child: RaisedButton(
//                color: Colors.blue,
//                textColor: Colors.white,
//                splashColor: Colors.blueGrey,
//                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => GenerateScreen()),
//                  );
//                },
//                child: const Text('GENERATE QR CODE')
//            ),
//          ),
//        ],
//      ),
//    );
  }
}
