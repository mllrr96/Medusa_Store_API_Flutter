import '../store_models/store/index.dart';
import 'common.dart';


class StoreCustomersRes {
  Customer? customer;

  StoreCustomersRes.fromJson(Map<String, dynamic> json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json["customer"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer;
    }
    return data;
  }
}

class StoreCustomersListOrdersRes extends PaginatedResponse {
  List<Order>? orders;

  StoreCustomersListOrdersRes.fromJson(json) : super.fromJson(json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders?.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders'] = orders?.map((e) => e.toJson()).toList() ;
    return data;
  }
}
