class ProductModel {
  final order_id;
  final order_code;
  final check_in_date;
  final total_amount;
  final discount;
  final discount_order_detail;
  final final_amount;
  final order_status;
  final order_type;
  final customer_id;
  final is_fixed_price;
  final delivery_status;
  final total_invoice_print;
  final vat;
  final vatamount;
  final number_of_guest;
  final group_payment_status;

  final List<OrderDetail> orderDetail;
    final List<Object> order_promotion_mapping;
  final List<Object> payment;
  final List<Object> receipt;

  int get getOrderId => order_id;
  String get getOrderCode => order_code;

  double get getTotalAmount => total_amount;

  String get getDiscountOrderDetail => discount_order_detail;

  String get getCheckInDate => check_in_date;

  String get getDiscount => discount;

  double get getFinalAmount => final_amount;

  int get getOrderStatus => order_status;

  String get getOrderType => order_type;

  int get getCustomerId => customer_id;

  String get getIsFixedPrice => is_fixed_price;

  String get getDeliveryStatus => delivery_status;

  String get getTotalInvoicePrint => total_invoice_print;

  String get getVat => vat;

  String get getVatAmount => vatamount;

  String get getNumberOfGuest => number_of_guest;

  String get getGroupPaymentStatus => group_payment_status;

  List<OrderDetail> get getDetail => orderDetail;

  List<Object> get getOrderPromotionMapping => order_promotion_mapping;

  List<Object> get getPayment => payment;

  List<Object> get getRecipt => receipt;

  ProductModel(
      this.order_id,
      this.order_code,
      this.check_in_date,
      this.total_amount,
      this.discount,
      this.discount_order_detail,
      this.final_amount,
      this.order_status,
      this.order_type,
      this.customer_id,
      this.is_fixed_price,
      this.delivery_status,
      this.total_invoice_print,
      this.vat,
      this.vatamount,
      this.number_of_guest,
      this.group_payment_status,
      this.orderDetail,
      this.order_promotion_mapping,
      this.payment,
      this.receipt);

  static ProductModel fromJson(Map<String, dynamic> json) {
    var list = json["order_detail"] as List;
    print(list.runtimeType);
    List<OrderDetail> orderList =
        list.map((e) => OrderDetail.fromJson(e)).toList();
    return ProductModel(
      json["order_id"],
      json["order_code"],
      json["check_in_date"],
      json["total_amount"],
      json["discount"],
      json["discount_order_detail"],
      json["final_amount"],
      json["order_status"],
      json["order_type"],
      json["customer_id"],
      json["is_fixed_price"],
      json["delivery_status"],
      json["total_invoice_print"],
      json["vat"],
      json["vatamount"],
      json["number_of_guest"],
      json["group_payment_status"],
      orderList,
      json["order_promotion_mapping"],
      json["payment"],
      json["receipt"],
    );
  }
}

class OrderDetail {
  final order_detail_id;
  final order_id;
  final product_id;
  final product_code;
  final product_name;
  final final_amount;
  final total_amount;
  final discount;
  final quantity;
  final order_date;
  final status;
  final unit_price;
  final product_order_type;
  final item_quantity;
  final order_group;
  final List<Object> order_detail_promotion_mapping;

  String get getOrderdetailid => order_detail_id;

  String get getOrderid => order_id;

  String get getProductid => product_id;

  String get getproductcode => product_code;

  String get getproductname => product_name;

  double get getfinalamount => final_amount;

  double get gettotalamount => total_amount;

  String get getdiscount => discount;

  int get getquantity => quantity;

  String get getorderdate => order_date;

  String get getstatus => status;

  String get getunitprice => unit_price;

  String get getproductordertype => product_order_type;

  String get getitemquantity => item_quantity;

  String get getordergroup => order_group;

  List<Object> get getorderdetailpromotionmapping =>
      order_detail_promotion_mapping;

  OrderDetail(
      this.order_detail_id,
      this.order_id,
      this.product_id,
      this.product_code,
      this.product_name,
      this.final_amount,
      this.total_amount,
      this.discount,
      this.quantity,
      this.order_date,
      this.status,
      this.unit_price,
      this.product_order_type,
      this.item_quantity,
      this.order_group,
      this.order_detail_promotion_mapping);

  static OrderDetail fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      json["order_detail_id"],
      json["order_id"],
      json["product_id"],
      json["product_code"],
      json["product_name"],
      json["final_amount"],
      json["total_amount"],
      json["discount"],
      json["quantity"],
      json["order_date"],
      json["status"],
      json["unit_price"],
      json["product_order_type"],
      json["item_quantity"],
      json["order_group"],
      json["order_detail_promotion_mapping"],
    );
  }
}
