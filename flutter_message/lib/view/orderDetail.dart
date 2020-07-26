import 'package:flutter/material.dart';
import 'package:fluttermessage/bloc/orderHistory/ProductModel.dart';

class OrderDetailPage extends StatelessWidget {
  ProductModel dataRe;

  OrderDetailPage(this.dataRe);

  String status = "Thất bại";
  List<OrderDetail> detailInfo;

  void setState() {
    if (dataRe.getOrderStatus != 0) {
      status = "Thành công";
    } else
      status = "Thất bại";
  }

  @override
  Widget build(BuildContext context) {
    setState();
    if(status == "Thành công"){
      return Scaffold(
        appBar: AppBar(
          title: Text("Chi tiết đơn hàng"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Đơn hàng số "+dataRe.getOrderId.toString(),
                style: TextStyle(fontSize: 30),),
              Text("-" + dataRe.getTotalAmount.toString()+" VND",
                style: TextStyle(fontSize: 27),
              ),
              Text(
                status,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Tên sản phẩm"),
                    SizedBox(width: 50,),
                    Text("Số Lượng"),
                    SizedBox(width: 50,),
                    Text("Thành tiền"),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _listProduct(context),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Amount"),
                    SizedBox(width: 155,),
                    Text(dataRe.getFinalAmount.toString() + " VND"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Chi tiết đơn hàng"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50,),
              Text("Đơn hàng số "+dataRe.getOrderId.toString(),
                style: TextStyle(fontSize: 30),),
              Text("-" + dataRe.getTotalAmount.toString()+" VND",
                style: TextStyle(fontSize: 27),
              ),
              Text(
                status,
                style: TextStyle(
                    color: Colors.red,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Tên sản phẩm"),
                    SizedBox(width: 35,),
                    Text("Số Lượng"),
                    SizedBox(width: 30,),
                    Text("Thành tiền"),
                  ],
                ),
              ),
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _listProduct(context),
                    ],
                ),
              ),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total Amount"),
                      SizedBox(width: 155,),
                      Text(dataRe.getFinalAmount.toString() + " VND"),
                    ],
                  ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _listProduct(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: dataRe.getDetail.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
              children: <Widget>[
                Text(dataRe.getDetail[index].getproductname),
                SizedBox(width: 100,),
                Text(dataRe.getDetail[index].getquantity.toString(),),
                SizedBox(width: 75,),
                Text(dataRe.getDetail[index].gettotalamount.toString()),
              ],
            ),
        );
      },
    );
  }
}
