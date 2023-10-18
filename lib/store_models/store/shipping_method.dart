import 'index.dart';

class ShippingMethod {
  /// The shipping method's id
  ///
  /// Example: "sm_01F0YET7DR2E7CYVSDHM593QG2"Copy to Clipboard
  final String? id;

  /// The id of the shipping option that the shipping method is built from.
  ///
  /// Example: "so_01G1G5V27GYX4QXNARRQCW1N8T"Copy to Clipboard
  final String? shippingOptionId;

  /// The details of the shipping option the method was created from.
  final ShippingOption? shippingOption;

  /// The id of the order that the shipping method is used in.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? orderId;

  /// The details of the order that the shipping method is used in.
  final Order? order;

  /// The id of the return that the shipping method is used in.
  final String? returnId;

  /// The details of the return that the shipping method is used in.
  final Return? returnOrder;

  /// The id of the swap that the shipping method is used in.
  final String? swapId;

  /// The details of the swap that the shipping method is used in.
  final Swap? swap;

  /// The id of the cart that the shipping method is used in.
  ///
  /// Example: "cart_01G8ZH853Y6TFXWPG5EYE81X63"
  final String? cartId;

  ///The details of the cart that the shipping method is used in.
  final Cart? cart;

  /// The id of the claim that the shipping method is used in.
  final String? claimOrderId;

  /// The details of the claim that the shipping method is used in.
  final ClaimOrder? claimOrder;

  /// The details of the tax lines applied on the shipping method.
  final List<ShippingMethodTaxLine>? taxLines;

  /// The amount to charge for the shipping method. the currency of the price is defined by the region that the order that the shipping method belongs to is a part of.
  ///
  /// Example: 200
  final int? price;

  /// The subtotal of the shipping
  ///
  /// Example: 8000
  final int? subTotal;

  /// The total amount of the shipping
  ///
  /// Example: 8200
  final int? total;

  /// The total of tax
  final int? taxTotal;

  /// Additional data that the fulfillment provider needs to fulfill the shipment. this is used in combination with the shipping options data, and may contain information such as a drop point id.
  final Map<String, dynamic>? data;

  /// Whether the shipping method price include tax
  ///
  /// feature flag
  final bool? includesTax;

  ShippingMethod({
    this.id,
    required this.shippingOptionId,
    this.shippingOption,
    this.orderId,
    this.subTotal,
    this.total,
    this.taxTotal,
    this.order,
    this.returnId,
    this.returnOrder,
    this.swapId,
    this.swap,
    this.cartId,
    this.cart,
    this.claimOrderId,
    this.claimOrder,
    this.taxLines,
    required this.price,
    this.data = const {},
    this.includesTax,
  });

  factory ShippingMethod.fromJson(Map<String, dynamic> json) {
    List<ShippingMethodTaxLine>? taxLines;
    if (json['tax_lines'] != null) {
      taxLines = <ShippingMethodTaxLine>[];
      json['tax_lines'].forEach((e) => taxLines!.add(ShippingMethodTaxLine.fromJson(e)));
    }

    return ShippingMethod(
      id: json['id'],
      shippingOptionId: json['shipping_option_id'],
      shippingOption: json['shipping_option'] != null ? ShippingOption.fromJson(json['shipping_option']) : null,
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      returnId: json['return_id'],
      returnOrder: json['return_order'] != null ? Return.fromJson(json['return_order']) : null,
      swapId: json['swap_id'],
      swap: json['swap'] != null ? Swap.fromJson(json['swap']) : null,
      cartId: json['cart_id'],
      cart: json['cart'] != null ? Cart.fromJson(json['cart']) : null,
      claimOrderId: json['claim_order_id'],
      claimOrder: json['claim_order'] != null ? ClaimOrder.fromJson(json['claim_order']) : null,
      price: json['price'],
      data: json['data'],
      includesTax: json['includes_tax'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['shipping_option_id'] = shippingOptionId;
    json['shipping_option'] = shippingOption?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['return_id'] = returnId;
    json['return_order'] = returnOrder?.toJson();
    json['swap_id'] = swap;
    json['swap'] = swap?.toJson();
    json['cart_id'] = cart;
    json['cart'] = cart?.toJson();
    json['claim_order_id'] = claimOrderId;
    json['claim_order'] = claimOrder?.toJson();
    json['tax_lines'] = taxLines?.map((e) => e.toJson()).toList();
    json['price'] = price;
    json['data'] = data;
    json['includes_tax'] = includesTax;
    return json;
  }
}
