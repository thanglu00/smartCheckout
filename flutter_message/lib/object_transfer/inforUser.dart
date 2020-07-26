import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class InformUser {
  final customerId;
  final customerName;
  final phoneNumber;
  final balance;
  final List<Object> receipt;

int get getCustomerId => customerId;
String get getCustomerName => customerName;
String get getPhoneNumber => phoneNumber;
double get getBalance => balance;
List<Object> get getReceipt => receipt;

  InformUser(this.customerId, this.customerName, this.phoneNumber, this.balance,
      this.receipt);

  static InformUser fromJson(Map<String, dynamic> json) {
    return InformUser(
      json["customer_id"],
      json["customer_name"],
      json["phone_number"],
      json["balance"],
      json["receipt"],
    );
  }
}

class UserRepo {
  Future<String> getAuthoLogin(Post post) async {
    final baseUrl = "http://54.169.64.6:43234/api/accounts/login";
    final result = await http.post(baseUrl,
        body: jsonEncode(post.toMap()),
        headers: {HttpHeaders.contentTypeHeader: 'application/json-patch+json'});
    //print(json.encode(post.toMap()));
    print(result.body);
    return result.body;
  }

  Future<InformUser> getUser(String nameUser, String phone) async {
    final baseUrl = "http://54.169.64.6:43234/api/accounts/info";
    Post po = new Post(phoneNumber: "$phone", name: "$nameUser");
    final token = await getAuthoLogin(po);
    final result = await http.get(baseUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (result.statusCode != 200) {
      throw new Exception('Error getting product');
    }
    final json = jsonDecode(result.body);
    print(result.body);
    return InformUser.fromJson(json);
  }
}

class Post {
  final String phoneNumber;
  final String name;

  Post({this.phoneNumber, this.name});

  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      phoneNumber: json['phone'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson(Post po) =>
      <String, dynamic>{"phone": phoneNumber, "name": name};

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["phone"] = phoneNumber;
    map["name"] = name;
    print(map);
    return map;
  }
}
