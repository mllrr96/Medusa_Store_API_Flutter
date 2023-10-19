import 'index.dart';

class Payment {
  /// The payment's id
  ///
  /// Example: "pay_01G2SJNT6DEEWDFNAJ4XWDTHKE"
  final String? id;

  /// The id of the swap that this payment was potentially created for.
  final String? swapId;

  /// The details of the swap that this payment was potentially created for.
  final Swap? swap;

  /// The id of the cart that the payment session was potentially created for.
  final String? cartId;

  /// The details of the cart that the payment session was potentially created for.
  final Cart? cart;

  /// The id of the order that the payment session was potentially created for.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? orderId;

  /// The details of the order that the payment session was potentially created for.
  final Order? order;

  /// The amount that the payment has been authorized for.
  ///
  /// Example: 100
  final int? amount;

  /// The 3 character iso currency code of the payment.
  ///
  /// Example: "usd"
  final String? currencyCode;

  /// The details of the currency of the payment.
  final Currency? currency;

  /// The amount of the original payment amount that has been refunded back to the customer.
  final int? amountRefunded;

  /// The id of the payment provider that is responsible for the payment
  ///
  /// Example: "manual"
  final String? providerId;

  /// The data required for the payment provider to identify, modify and process the payment. typically this will be an object that holds an id to the external payment session, but can be an empty object if the payment provider doesn't hold any state.
  final Map<String, dynamic>? data;

  /// Randomly generated key used to continue the completion of a payment in case of failure.
  final String? idempotencyKey;

  /// The date with timezone at which the payment was captured.
  final DateTime? capturedAt;

  /// The date with timezone at which the payment was canceled.
  final DateTime? canceledAt;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;
  Payment({
    this.id,
    this.swapId,
    this.swap,
    this.cartId,
    this.cart,
    this.orderId,
    this.order,
    required this.amount,
    required this.currencyCode,
    this.currency,
    this.amountRefunded,
    required this.providerId,
    this.data,
    this.idempotencyKey,
    this.capturedAt,
    this.canceledAt,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      swapId: json['swap_id'],
      swap: json['swap'] != null ? Swap.fromJson(json['swap']) : null,
      cartId: json['cart_id'],
      cart: json['cart'] != null ? Cart.fromJson(json['cart']) : null,
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      amount: json['amount'],
      currencyCode: json['currency_code'],
      currency: json['currency'] != null ? Currency.fromJson(json['currency']) : null,
      amountRefunded: json['amount_refunded'],
      providerId: json['provider_id'],
      data: json['data'],
      idempotencyKey: json['idempotency_key'],
      capturedAt: DateTime.tryParse(json['captured_at'] ?? '')?.toLocal(),
      canceledAt: DateTime.tryParse(json['canceled_at'] ?? '')?.toLocal(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['swap_id'] = swapId;
    json['swap'] = swap?.toJson();
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['amount'] = amount;
    json['currency_code'] = currencyCode;
    json['currency'] = currency?.toJson();
    json['amount_refunded'] = amountRefunded;
    json['provider_id'] = providerId;
    json['data'] = data;
    json['idempotency_key'] = idempotencyKey;
    json['captured_at'] = capturedAt.toString();
    json['canceled_at'] = canceledAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
