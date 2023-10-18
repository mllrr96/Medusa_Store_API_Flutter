import '../store_models/common/index.dart';

class StorePostSwapsReq {
  /// The id of the order to create the swap for.
  final String? orderId;

  /// The items to include in the return.
  final List<ReturnItem>? returnItems;
  final List<AdditionalItem>? additionalItems;

  /// The id of the shipping option to create the shipping method from.
  final String? returnShippingOption;

  StorePostSwapsReq({this.orderId, this.returnItems, this.additionalItems, this.returnShippingOption});

  factory StorePostSwapsReq.fromJson(Map<String, dynamic> json) {
    List<ReturnItem>? returnItems;
    List<AdditionalItem>? additionalItems;

    if (json['return_items'] != null) {
      returnItems = <ReturnItem>[];
      json['return_items'].forEach((v) {
        returnItems!.add(ReturnItem.fromJson(v));
      });
    }

    if (json['additional_items'] != null) {
      additionalItems = <AdditionalItem>[];
      json['additional_items'].forEach((v) {
        additionalItems!.add(AdditionalItem.fromJson(v));
      });
    }

    return StorePostSwapsReq(
      orderId: json['order_id'],
      returnShippingOption: json['return_shipping_option'],
      returnItems: returnItems,
      additionalItems: additionalItems,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    if (returnItems != null) {
      data['return_items'] = returnItems!.map((v) => v.toJson()).toList();
    }
    if (additionalItems != null) {
      data['additional_items'] = additionalItems!.map((v) => v.toJson()).toList();
    }
    data['return_shipping_option'] = returnShippingOption;
    return data;
  }
}
