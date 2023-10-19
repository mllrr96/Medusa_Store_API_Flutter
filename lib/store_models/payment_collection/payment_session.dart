import '../store/cart.dart';

class PaymentSession {
  /// The payment session's id
  ///
  /// Example: "ps_01G901XNSRM2YS3ASN9H5KG3FZ"
  final String? id;

  /// The id of the cart that the payment session was created for.
  ///
  /// Example: "cart_01G8ZH853Y6TFXWPG5EYE81X63"
  final String? cartId;

  /// The details of the cart that the payment session was created for.
  final Cart? cart;

  /// The id of the payment provider that is responsible for the payment session
  ///
  /// Example: "manual"
  final String? providerId;

  /// A flag to indicate if the payment session has been selected as the method that will be used to complete the purchase.
  final bool? isSelected;

  /// Indicates the status of the payment session. will default to pending, and will eventually become authorized. payment sessions may have the status of requires_more to indicate that further actions are to be completed by the customer.
  final PaymentSessionStatus? status;

  /// The amount that the payment session has been authorized for.
  final int? amount;

  /// The data required for the payment provider to identify, modify and process the payment session. typically this will be an object that holds an id to the external payment session, but can be an empty object if the payment provider doesn't hold any state.
  final Map<String, dynamic>? data;

  /// Randomly generated key used to continue the completion of a cart in case of failure.
  final String? idempotencyKey;

  /// The date with timezone at which the payment session was authorized.
  final DateTime? paymentAuthorizedAt;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  PaymentSession({
    this.id,
    required this.cartId,
    this.cart,
    required this.providerId,
    this.isSelected,
    required this.status,
    this.data,
    this.idempotencyKey,
    this.amount,
    this.paymentAuthorizedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentSession.fromJson(Map<String, dynamic> json) {
    return PaymentSession(
      id: json['id'],
      cartId: json['cart_id'],
      cart: json['cart'] != null ? Cart.fromJson(json['cart']) : null,
      providerId: json['provider_id'],
      isSelected: json['is_selected'] ?? true,
      status: json['status'] != null ? PaymentSessionStatus.values.firstWhere((e) => e.value == json['status']) : null,
      data: json['data'],
      idempotencyKey: json['idempotency_key'],
      amount: json['amount'],
      paymentAuthorizedAt: DateTime.tryParse(json['payment_authorized_at'] ?? ''),
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['cart_id'] = cartId;
    json['cart'] = cart?.toJson();
    json['provider_id'] = providerId;
    json['is_selected'] = isSelected;
    json['status'] = status?.value ?? '';
    json['data'] = data;
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    return json;
  }
}

enum PaymentSessionStatus {
  authorized('authorized'),
  pending('pending'),
  requiresMore('requires_more'),
  error('error'),
  canceled('canceled');

  final String value;

  const PaymentSessionStatus(this.value);
}
