import '../../../enum/enums.dart';
import '../index.dart';
import 'index.dart';

class Swap {
  /// The swap's id
  ///
  /// Example: "swap_01F0YET86Y9G92D3YDR9Y6V676"
  final String? id;

  /// The status of the fulfillment of the swap.
  final SwapFulfillmentStatus? fulfillmentStatus;

  /// The status of the payment of the swap. the payment may either refer to the refund of an amount or the authorization of a new amount.
  final SwapPaymentStatus? paymentStatus;

  /// The id of the order that the swap belongs to.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? orderId;

  /// The details of the order that the swap belongs to.
  final Order? order;

  /// The details of the new products to send to the customer, represented as line items.
  final List<LineItem>? additionalItems;

  /// The details of the return that belongs to the swap, which holds the details on the items being returned.
  final Return? returnOrder;

  /// The details of the fulfillments that are used to send the new items to the customer.
  final List<Fulfillment>? fulfillments;

  /// The details of the additional payment authorized by the customer when difference_due is positive.
  final Payment? payment;

  /// The difference amount between the order’s original total and the new total imposed by the swap. if its value is negative, a refund must be issues to the customer. if it's positive, additional payment must be authorized by the customer. otherwise, no payment processing is required.
  final int? differenceDue;

  /// The address to send the new line items to - in most cases this will be the same as the shipping address on the order.
  ///
  /// Example: "addr_01G8ZH853YPY9B94857DY91YGW"
  final String? shippingAddressId;

  /// The details of the shipping address that the new items should be sent to.
  final Address? shippingAddress;

  /// The details of the shipping methods used to fulfill the additional items purchased.
  final List<ShippingMethod>? shippingMethods;

  /// The id of the cart that the customer uses to complete the swap.
  ///
  /// Example: "cart_01G8ZH853Y6TFXWPG5EYE81X63"
  final String? cartId;

  /// The details of the cart that the customer uses to complete the swap.
  final Cart? cart;

  /// The date with timezone at which the swap was confirmed by the customer.
  final DateTime? confirmedAt;

  /// The date with timezone at which the swap was canceled.
  final DateTime? canceledAt;

  /// If set to true, no notification will be sent related to this swap
  final bool? noNotification;

  /// If true, swaps can be completed with items out of stock
  final bool? allowBackorder;

  /// Randomly generated key used to continue the completion of the swap in case of failure.
  ///
  /// Related guide: [Learn more how to use the idempotency key.](https://docs.medusajs.com/development/idempotency-key/overview)
  final String? idempotencyKey;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Swap({
    this.id,
    this.fulfillmentStatus,
    this.paymentStatus,
    this.orderId,
    this.order,
    this.additionalItems,
    this.returnOrder,
    this.fulfillments,
    this.payment,
    this.differenceDue,
    this.shippingAddressId,
    this.shippingAddress,
    this.shippingMethods,
    this.cartId,
    this.cart,
    this.confirmedAt,
    this.canceledAt,
    this.noNotification,
    this.allowBackorder,
    this.idempotencyKey,
    this.metadata,
  });

  factory Swap.fromJson(Map<String, dynamic> json) {
    List<LineItem>? additionalItems;
    List<Fulfillment>? fulfillments;
    List<ShippingMethod>? shippingMethods;

    if (json['additional_items'] != null) {
      additionalItems = <LineItem>[];
      json['additional_items'].forEach((v) {
        additionalItems!.add(LineItem.fromJson(v));
      });
    }
    if (json['fulfillments'] != null) {
      fulfillments = <Fulfillment>[];
      json['fulfillments'].forEach((v) {
        fulfillments!.add(Fulfillment.fromJson(v));
      });
    }
    if (json['shipping_methods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shipping_methods'].forEach((v) {
        shippingMethods!.add(ShippingMethod.fromJson(v));
      });
    }

    return Swap(
      id: json['id'],
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      returnOrder: json['return_order'] != null ? Return.fromJson(json['return_order']) : null,
      fulfillmentStatus:
          SwapFulfillmentStatus.values.where((element) => element.value == json['fulfillment_status']).firstOrNull,
      paymentStatus: SwapPaymentStatus.values.where((element) => element.value == json['payment_status']).firstOrNull,
      payment: json['payment'] != null ? Payment.fromJson(json['payment']) : null,
      differenceDue: json['difference_due'],
      shippingAddressId: json['shipping_address_id'],
      shippingAddress: json['shipping_address'] != null ? Address.fromJson(json['shipping_address']) : null,
      additionalItems: additionalItems,
      fulfillments: fulfillments,
      shippingMethods: shippingMethods,
      cartId: json['cart_id'],
      cart: json['cart'] != null ? Cart.fromJson(json['cart']) : null,
      confirmedAt: DateTime.tryParse(json['confirmed_at'] ?? ''),
      canceledAt: DateTime.tryParse(json['canceled_at'] ?? ''),
      noNotification: json['no_notification'],
      allowBackorder: json['allow_backorder'],
      idempotencyKey: json['idempotency_key'],
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fulfillment_status'] = fulfillmentStatus?.value;
    data['payment_status'] = paymentStatus?.value;
    data['order_id'] = orderId;
    data['order'] = order?.toJson();
    if (additionalItems != null) {
      data['additional_items'] = additionalItems!.map((v) => v.toJson()).toList();
    }
    data['return_order'] = returnOrder?.toJson();
    if (fulfillments != null) {
      data['fulfillments'] = fulfillments!.map((v) => v.toJson()).toList();
    }
    data['payment'] = payment?.toJson();
    data['difference_due'] = differenceDue;
    data['shipping_address_id'] = shippingAddressId;
    data['shipping_address'] = shippingAddress?.toJson();
    if (shippingMethods != null) {
      data['shipping_methods'] = shippingMethods!.map((v) => v.toJson()).toList();
    }
    data['cart_id'] = cartId;
    data['cart'] = cart;
    data['confirmed_at'] = confirmedAt.toString();
    data['canceled_at'] = canceledAt.toString();
    data['no_notification'] = noNotification;
    data['allow_backorder'] = allowBackorder;
    data['idempotency_key'] = idempotencyKey;
    data['metadata'] = metadata;
    return data;
  }
}
