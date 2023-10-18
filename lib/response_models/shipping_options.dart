import '../store_models/store/index.dart';

class StoreShippingOptionsListRes {
  List<ShippingOption>? shippingOptions;

  StoreShippingOptionsListRes.fromJson(json) {
    if (json['shipping_options'] != null) {
      shippingOptions = <ShippingOption>[];
      json['shipping_options'].forEach((v) {
        shippingOptions?.add(ShippingOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shipping_options'] =
        shippingOptions?.map((e) => e.toJson()).toList();
    return data;
  }
}
