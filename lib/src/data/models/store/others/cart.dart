import '../../../enum/enums.dart';
import '../index.dart';
import 'index.dart';

class Cart {
  /// Example: "cart_01G8ZH853Y6TFXWPG5EYE81X63"
  // The cart's id
  final String? id;

  /// The email associated with the cart
  final String? email;

  /// The billing address's id
  ///
  /// Example: "addr_01G8ZH853YPY9B94857DY91YGW"
  final String? billingAddressId;

  /// The details of the billing address associated with the cart.
  final Address? billingAddress;

  /// The shipping address's id
  ///
  /// Example: "addr_01G8ZH853YPY9B94857DY91YGW"
  final String? shippingAddressId;

  /// The details of the shipping address associated with the cart.
  final Address? shippingAddress;

  /// The line items added to the cart.
  final List<LineItem>? items;

  /// The region's id
  ///
  /// Example: "reg_01G1G5V26T9H8Y0M4JNE3YGA4G"
  final String? regionId;

  /// The details of the region associated with the cart.
  final Region? region;

  /// An array of details of all discounts applied to the cart.
  final List<Discount>? discounts;

  /// An array of details of all gift cards applied to the cart.
  final List<GiftCard>? giftCards;

  /// The customer's id
  ///
  /// Example: "cus_01G2SG30J8C85S4A5CHM2S1NS2"
  final String? customerId;

  /// The details of the customer the cart belongs to.
  final Customer? customer;

  /// The details of the selected payment session in the cart.
  final PaymentSession? paymentSession;

  /// The details of all payment sessions created on the cart.
  final List<PaymentSession>? paymentSessions;

  /// The payment's id if available
  ///
  /// Example: "pay_01G8ZCC5W42ZNY842124G7P5R9"
  final String? paymentId;

  /// The details of the payment associated with the cart.
  final Payment? payment;

  /// The details of the shipping methods added to the cart.
  final List<ShippingMethod>? shippingMethods;

  /// The cart's type.
  final CartType type;

  /// The date with timezone at which the cart was completed.
  final DateTime? completedAt;

  /// The date with timezone at which the payment was authorized.
  final DateTime? paymentAuthorizedAt;

  /// Randomly generated key used to continue the completion of a cart in case of failure.
  final String? idempotencyKey;

  /// The context of the cart which can include info like ip or user agent.
  ///
  /// Example: {"ip":"::1","user_agent":"PostmanRuntime/7.29.2"}
  final Map<String, dynamic>? context;

  /// The sales channel id the cart is associated with.
  final String? salesChannelId;

  /// The details of the sales channel associated with the cart.
  final SalesChannel? salesChannel;

  /// The total of shipping
  ///
  /// Example: 1000
  final int? shippingTotal;

  /// The total of discount rounded
  ///
  /// Example: 800
  final int? discountTotal;

  /// The total of tax
  ///
  /// Example: 0
  final int? taxTotal;

  /// The total amount refunded if the order associated with this cart is returned.
  ///
  /// Example: 0
  final int? refundedTotal;

  /// The total amount of the cart
  ///
  /// Example: 8200
  final int? total;

  /// The subtotal of the cart
  ///
  /// Example: 8000
  final int? subTotal;

  /// The amount that can be refunded
  ///
  /// Example: 8200
  final int? refundableAmount;

  /// The total of gift cards
  ///
  /// Example: 0
  final int? giftCardTotal;

  /// The total of gift cards with taxes
  ///
  /// Example: 0
  final int? giftCardTaxTotal;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Cart({
    this.id,
    this.email,
    this.billingAddressId,
    this.billingAddress,
    this.shippingAddressId,
    this.shippingAddress,
    this.items,
    this.regionId,
    this.region,
    this.discounts,
    this.giftCards,
    this.customerId,
    this.customer,
    this.paymentSession,
    this.paymentSessions,
    this.paymentId,
    this.payment,
    this.shippingMethods,
    this.completedAt,
    this.paymentAuthorizedAt,
    this.idempotencyKey,
    this.context,
    this.salesChannelId,
    this.salesChannel,
    this.shippingTotal,
    this.discountTotal,
    this.taxTotal,
    this.refundedTotal,
    this.total,
    this.subTotal,
    this.refundableAmount,
    this.giftCardTotal,
    this.giftCardTaxTotal,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
    this.type = CartType.defaultType,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    List<ShippingMethod>? shippingMethods;
    List<LineItem>? items;
    List<Discount>? discounts;
    List<GiftCard>? giftCards;
    List<PaymentSession>? paymentSessions;
    if (json['shipping_methods'] != null) {
      shippingMethods = <ShippingMethod>[];
      json['shipping_methods'].forEach((e) => shippingMethods!.add(ShippingMethod.fromJson(e)));
    }
    if (json['items'] != null) {
      items = <LineItem>[];
      json['items'].forEach((e) => items!.add(LineItem.fromJson(e)));
    }
    if (json['discounts'] != null) {
      discounts = <Discount>[];
      json['discounts'].forEach((e) => discounts!.add(Discount.fromJson(e)));
    }
    if (json['gift_cards'] != null) {
      giftCards = <GiftCard>[];
      json['gift_cards'].forEach((e) => giftCards!.add(GiftCard.fromJson(e)));
    }
    if (json['payment_sessions'] != null) {
      paymentSessions = <PaymentSession>[];
      json['payment_sessions'].forEach((e) => paymentSessions!.add(PaymentSession.fromJson(e)));
    }

    return Cart(
      id: json['id'],
      email: json['email'],
      billingAddressId: json['billing_address_id'],
      billingAddress: json['billing_address'] != null ? Address.fromJson(json['billing_address']) : null,
      shippingAddressId: json['shipping_address_id'],
      shippingAddress: json['shipping_address'] != null ? Address.fromJson(json['shipping_address']) : null,
      regionId: json['region_id'],
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
      customerId: json['customer_id'],
      customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      paymentSession: json['payment_session'] != null ? PaymentSession.fromJson(json['payment_session']) : null,
      paymentId: json['payment_id'],
      payment: json['payment'] != null ? Payment.fromJson(json['payment']) : null,
      type: CartType.values.firstWhere((e) => e.value == (json['type'] ?? ''), orElse: () => CartType.defaultType),
      completedAt: DateTime.tryParse(json['completed_at'] ?? '')?.toLocal(),
      paymentAuthorizedAt: DateTime.tryParse(json['payment_authorized_at'] ?? '')?.toLocal(),
      idempotencyKey: json['idempotency_key'],
      context: json['context'],
      salesChannelId: json['sales_channel_id'],
      salesChannel: json['sales_channel'] != null ? SalesChannel.fromJson(json['sales_channel'] ?? '') : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
      shippingTotal: json['shipping_total'],
      discountTotal: json['discount_total'],
      taxTotal: json['tax_total'],
      refundedTotal: json['refunded_total'],
      total: json['total'],
      subTotal: json['subtotal'],
      refundableAmount: json['refundable_amount'],
      giftCardTotal: json['gift_card_total'],
      giftCardTaxTotal: json['gift_card_tax_total'],
      discounts: discounts,
      shippingMethods: shippingMethods,
      items: items,
      giftCards: giftCards,
      paymentSessions: paymentSessions,
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['billing_address_id'] = billingAddressId;
    json['billing_address'] = billingAddress;
    json['shipping_address_id'] = shippingAddressId;
    json['shipping_address'] = shippingAddress;
    json['items'] = items?.map((e) => e.toJson()).toList();
    json['region_id'] = regionId;
    json['region'] = region?.toJson();
    json['discounts'] = discounts?.map((e) => e.toJson()).toList();
    json['gift_cards'] = giftCards?.map((e) => e.toJson()).toList();
    json['customer_id'] = customerId;
    json['customer'] = customer?.toJson();
    json['payment_session'] = paymentSession?.toJson();
    json['payment_sessions'] = paymentSessions?.map((e) => e.toJson()).toList();
    json['payment_id'] = paymentId;
    json['payment'] = payment?.toJson();
    json['shipping_methods'] = shippingMethods?.map((e) => e.toJson()).toList();
    json['type'] = type.value;
    json['completed_at'] = completedAt.toString();
    json['payment_authorized_at'] = paymentAuthorizedAt.toString();
    json['idempotency_key'] = idempotencyKey;
    json['context'] = context;
    json['sales_channel_id'] = salesChannelId;
    json['sales_channel'] = salesChannel?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    json['shipping_total'] = shippingTotal;
    json['discount_total'] = discountTotal;
    json['tax_total'] = taxTotal;
    json['refunded_total'] = refundedTotal;
    json['total'] = total;
    json['subtotal'] = subTotal;
    json['refundable_amount'] = refundableAmount;
    json['gift_card_total'] = giftCardTotal;
    json['gift_card_tax_total'] = giftCardTaxTotal;
    return json;
  }
}

