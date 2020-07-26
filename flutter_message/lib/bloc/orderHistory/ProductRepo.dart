import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ProductModel.dart';

class ProductRepo {

  Future<String> getAuthoLogin(Post post) async{
    final baseUrl ="http://54.169.64.6:43234/api/accounts/login";
    final result = await http.post(baseUrl,body:jsonEncode(post.toJson(post)));
    print(post.toJson(post));
    print(result);
    return result.toString();
  }

  Future<List<ProductModel>> getProduct(String id) async {
    final baseUrl = "http://54.169.64.6:43234/api/orders/history";
    Post po = new Post(phoneNumber: "0123456789",name: "Thang");
    final token = await getAuthoLogin(po);
    final result = await http.get(baseUrl,headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }
    );
    if (result.statusCode != 200) {
      throw new Exception('Error getting product');
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
}

class Post{
  final String phoneNumber;
  final String name;

  Post({this.phoneNumber, this.name});
  static Post fromJson(Map<String,dynamic> json){
    return Post(
      phoneNumber: json['phone'],
      name: json['name'],
    );
  }
  Map<String,dynamic> toJson(Post po) => <String,dynamic>{
    "phone":phoneNumber,
    "name" :name 
  };
  Map toMap(){
    var map = new Map<String,dynamic>();
    map["phone"] = phoneNumber;
    map["name"] = name;
    print(map);
    return map;

  }


}
