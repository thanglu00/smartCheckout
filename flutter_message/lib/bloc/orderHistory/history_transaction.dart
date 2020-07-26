import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fluttermessage/bloc/orderHistory/ProductModel.dart';
import 'package:fluttermessage/bloc/orderHistory/ProductRepo.dart';
import 'package:fluttermessage/bloc/orderHistory/listproducts.dart';
import 'package:http/http.dart' as http;



class History_View extends StatefulWidget {
  String gmailUser;
  History_View({Key key,this.gmailUser}) : super(key : key);
  @override
  _MyHistoryView createState() => _MyHistoryView();
}

class _MyHistoryView extends State<History_View> {
//  StreamController _orderStream;

  Future<String> getAuthoLogin(Post post) async {
    final baseUrl = "http://54.169.64.6:43234/api/accounts/login";
    final result = await http.post(baseUrl,
        body: jsonEncode(post.toMap()),
        headers: {HttpHeaders.contentTypeHeader: 'application/json-patch+json'});
    //print(json.encode(post.toMap()));
    print(result.body);
    return result.body;
  }

  Future<List<ProductModel>> getProduct() async {
    final baseUrl = "http://54.169.64.6:43234/api/orders/history";
    String phoneNumber2;
    String name2;
    await _db.collection("users").document(widget.gmailUser).get().then((event) {
      print(widget.gmailUser);
      print(event.data["phone"]);
      phoneNumber2 = event.data["phone"];
      name2 = event.data["name"];
    });

    Post po = new Post(phoneNumber: "$phoneNumber2", name: "$name2");
    final token = await getAuthoLogin(po);
    print(token);
    final result = await http.get(baseUrl, headers: {
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    });
    if (result.statusCode != 200) {
      throw new Exception(result.statusCode);
    }
    final json = jsonDecode(result.body) as List;
    print(result.body);
    List<ProductModel> productList = [];
    for (var u in json) {
      ProductModel product = ProductModel.fromJson(u);
      productList.add(product);
    }
    print(productList.length);
    return productList;
  }

  final Firestore _db = Firestore.instance;
  String phoneNumber;
  String name;

   void getPhoneandName() async {
    var result = await _db.collection("users").document(widget.gmailUser).get().then((event) {
      print(event.data["phone"]);
      phoneNumber = event.data["phone"];
      name = event.data["name"];
    });
  }

//  List<ProductModel> _orderListCHanged = [];
//   List<ProductModel> _orderDetailed =[];
//  onButtonChangeSuccess() async{
//      _orderListCHanged.clear();
//      _orderDetailed.forEach((element) {
//        //if(element.order_status)
//      });
//  }


  @override
  void initState(){
    super.initState();
    //getPhoneandName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "    Tìm kiếm giao dịch",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 30),
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
          FutureBuilder<List<ProductModel>>(
            future: getProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              print(snapshot);
              return snapshot.hasData
                  ? new Expanded(
                      child: ListViewProduct(products: snapshot.data))
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
