import '../store_models/store/index.dart';

class StoreOrderEditsRes {
  OrderEdit? orderEdit;

  StoreOrderEditsRes.fromJson(json) {
    orderEdit = json["order_edit"] != null
        ? OrderEdit.fromJson(json["order_edit"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_edit'] = orderEdit?.toJson();
    return data;
  }
}
