import 'package:flutter/material.dart';
import 'package:fluttermessage/bloc/orderHistory/ProductModel.dart';
import 'package:fluttermessage/view/orderDetail.dart';


class ListViewProduct extends StatelessWidget {
  final List<ProductModel> products;

  ListViewProduct({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: products.length,
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, position) {
            if(products[position].getOrderStatus == 0){
              return Container(
                child:
//                Divider(height: 5.0),
                ListTile(
                  leading:
                  Icon(Icons.do_not_disturb_on,color: Colors.red,),
//                  leading: Text(
//                    'Price ${products[position].price}',
//                    style: TextStyle(
//                      fontSize: 22.0,
//                      color: Colors.white,
//                    ),
//                  ),

                  title: Text(
                    'Order code ${products[position].getOrderId}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    'Total Amount ${products[position].getTotalAmount}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailPage(products[position])));
                    },
//                  onTap: () => _onTapItem(context, products[position]),
                ),
              );
            }else {
            return Container(
              child:
//                Divider(height: 5.0),
                ListTile(
                  leading:
                  Icon(Icons.check,color: Colors.green,),
//                  leading: Text(
//                    'Price ${products[position].price}',
//                    style: TextStyle(
//                      fontSize: 22.0,
//                      color: Colors.white,
//                    ),
//                  ),

                  title: Text(
                    'Order code ${products[position].getOrderId}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    'Total Amount ${products[position].getTotalAmount}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  onTap: () => _onTapItem(context, products[position]),
                ),
            );
            }
          }
          );

  }

  void _onTapItem(BuildContext context, ProductModel post) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailPage(post)));
    //Scaffold.of(context).showSnackBar(new SnackBar(
        //content: new Text(post.getOrderCode.toString() + ' - ' + post.getCustomerId.toString()+' - ' + post.getOrderStatus.toString())));
  }
}
