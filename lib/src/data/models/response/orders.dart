import '../store/orders/order.dart';

class StoreOrdersRes {
  Order? order;

  StoreOrdersRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order?.toJson();
    return data;
  }
}
