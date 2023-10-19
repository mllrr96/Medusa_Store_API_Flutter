import '../store_models/store/index.dart';

class StoreCustomersRes {
  Customer? customer;

  StoreCustomersRes.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null ? Customer.fromJson(json["customer"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer;
    }
    return data;
  }
}

class StoreCustomersListOrdersRes {
  final List<Order>? orders;
  StoreCustomersListOrdersRes(this.orders);
  factory StoreCustomersListOrdersRes.fromJson(json) {
    if (json['orders'] != null) {
      final orders = List<Order>.from((json['orders'] as List<Map<String, dynamic>>).map((x) => Order.fromJson(x)));
      return StoreCustomersListOrdersRes(orders);
    }

    return StoreCustomersListOrdersRes(null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders'] = orders?.map((e) => e.toJson()).toList();
    return data;
  }
}
